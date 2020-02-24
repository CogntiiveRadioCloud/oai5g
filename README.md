
|*** OAI Building & Executable architecture for recent versions was changed. As a result, updated and a recent instruction can be followed from the main gitlab repo [OAI5G](https://gitlab.eurecom.fr/oai/openairinterface5g/wikis/home)! - Just to be safe. Updated 24 Feb 2020  |
| --- |

# oai5g
Open Air Interface (OAI) Startup: (Installation and Configuration of Radio Access Network based on USRPx300)


*   [OAI Roadmap](#OAI)

	*	[H.W Requirements](#H.W.)
	*	[Kernal Setup and Intel Driver Configuration](#kernal)
	*	[E-UTRAN S.W. Installation](#S.W.)
	*	[Testing Radio Access Network Connection](#RAN)
	
*   [OAI Gitlab](#REF)


<h2 id="OAI">OAI Roadmap</h2>

<h3 id="H.W.">H.W Requirements</h3>

- Regarding the Host: Current OpenAirInterface software requires Intel architecture based PCs for the eNB or UE targets. This requirement is due to optimized DSP functions which make heavy use of integer SIMD instructions.

- Regarding the Radio Head: OAI supports a variety of Software Defined Radios including (Exmimo, USRP B200, USRP x300, LimeSDR)

<h3 id="kernal">Kernal and OS Requirements</h3>

First, we need to get a low latency kernal
- for Ubuntu 14.04
```bash
sudo apt-get install linux-image-3.19.0-61-lowlatency linux-headers-3.19.0-61-lowlatency
```
- for Ubuntu 16.04
```
sudo apt-get install linux-image-4.8.0-36-lowlatency linux-headers-4.8.0-36-lowlatency
```
- After Reboot You can check the installed kernal by typing
```bash
uname -a
``` 
If you still see the generic kernal, you have to select the kernal manually while rebooting from Advanced Option
or to set it to be the default accross system rebooting.
1. to know the exact installed kernal name ID.
```bash 
grep menuentry /boot/grub/grub.cfg
```
2. Add that name to grub-set-default to set the grub to load the new kernal by default while rebooting
```bash 
sudo grub-set-default "Ubuntu, with Linux 4.8.0-36-lowlatency"
sudo grub-reboot "Ubuntu, with Linux 4.8.0-36-lowlatency"
sudo update-grub
``` 
#### OAI Power Management
OAI requires to Remove all power management features in the BIOS (sleep states, in particular C-states) and CPU frequency scaling (Intel SpeedStep) so OAI can run with the maximum CPU clock 100% in performance mode and avoid  any scaling, also make sure to disable the p-state driver 

Add GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_pstate=disable" to /etc/default/grub
```bash
nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_pstate=disable"
```
Next we update the Governor to performance, Hence the all options are mentioned below.

| GOVERNOR      | Description.  |
| ------------- | ------------- |
| Performance   | Run the CPU at the maximum frequency 		 |
| powersave     | Run the CPU at the minimum frequency  	 |
| userspace 	| Run the CPU at user specified frequencies 	 |
| ondemand 	| Scales the frequency dynamically according to current load. Jumps to the highest frequency and then possibly back off as the idle time increases | 
| conservative  | Scales the frequency dynamically according to current load. Scales the frequency more gradually than ondemand |
| schedutil	|Scheduler-driven CPU frequency selection|



```bash
sudo apt-get install cpufrequtils
sudo echo GOVERNOR="performance"  >  /etc/default/cpufrequtils
sudo update-rc.d ondemand disable //to maintain the setting across system reboot
sudo /etc/init.d/cpufrequtils restart 
```
###### Checking the CPU cores
```bash
sudo cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
```

<h3 id="S.W.">E-UTRAN S.W. Installation</h3>

Checkout RAN repository (eNB RAN + UE RAN):
- for Ubuntu 16.04 Get the develop branch (up to date features)
```bash
git clone -r develop https://gitlab.eurecom.fr/oai/openairinterface5g.git
```
- for Ubuntu 14.04 Get the master branch (Stable)
```bash
git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git
```

```bash
cd openairinterface5g
```

###### Very important. It sets the correct environment variables. 
```bash
source oaienv
```
###### package installation + USRP Driver installation :
```bash
./build_oai -I
./build_oai -I -w USRP
```
###### Build OpenAirInterface eNB and UE without the EPC (without S1, nos1) 
```bash
./build_oai -w USRP --eNB --UE --noS1 -x
```
This command works only with master branch, it will not work with the develop branch because of the seperation of eNB and UE, so to compile only pass one argument at a time, UE either eNB.
```bash
./build_oai -w USRP --eNB --noS1 -x
```
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/img/RAN_noS1.png?raw=true"/>
</p>

<h3 id="RAN">Testing Radio Access Network Connection</h3>

### Running eNB

1st: Setup eNB IP
```bash
cd ~/openairinterface5g/
source oaienv
source ./cmake_targets/tools/init_nas_nos1 eNB
```
2nd: Check eNB IP

```bash
ifconfig 
```

```
oai0      Link encap:AMPR NET/ROM  HWaddr C2-C6-7B-07-22-08 
          inet addr:10.0.1.1  Bcast:10.0.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

```


```bash
cd cmake_targets
sudo -E ./lte_noS1_build_oai/build/lte-softmodem-nos1 -d -O $OPENAIR_TARGETS/PROJECTS/GENERIC-LTE-EPC/CONF/enb.band7.tm1.usrpb210.conf 2>&1 | tee ENB.log
```
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/img/eNB0.png?raw=true"/>
</p>



### Running UE

1st: Setup UE IP
```bash
cd ~/openairinterface5g/
source ./targets/bin/init_nas_nos1 UE
```

2nd: Check UE IP

```bash
ifconfig 
```

```
oai0      Link encap:AMPR NET/ROM  HWaddr 71-7C-CA-24-25-0B
          inet addr:10.0.1.9  Bcast:10.0.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

```bash
cd cmake_targets
sudo -E ./lte_noS1_build_oai/build/lte-softmodem-nos1  -U -C2660000000 -r25 --ue-scan-carrier --ue-txgain 90 --ue-rxgain 115 -d >&1 | tee UE.log
```

<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/img/UE0.png?raw=true"/>
</p>


<h3 id="REF">OAI Gitlab</h3>

OpenAirInterface is under OpenAirInterface Software Alliance license.
Refere to the main source code at GitLab

It is distributed under OAI Public License V1.0. 
The license information is distributed under LICENSE file in the same directory.
Please see NOTICE.txt for third party software that is included in the sources.

The OpenAirInterface (OAI) software is composed of the following parts: 

openairinterface5g
- cmake_targets: build utilities to compile (simulation, emulation and real-time platforms), and generated build files
- common : some common OAI utilities, other tools can be found at openair2/UTILS
- LICENSE
- maketags : script to generate emacs tags
- openair1 : 3GPP LTE Rel-10 PHY layer + PHY RF simulation and a subset of Rel 12 Features.
- openair2 :3GPP LTE Rel-10 RLC/MAC/PDCP/RRC/X2AP implementation. 
    - LAYER2/RLC/ with the following subdirectories: UM_v9.3.0, TM_v9.3.0, and AM_v9.3.0. 
    - LAYER2/PDCP/PDCP_v10.1.0. 
    - RRC/LITE
    - PHY_INTERFACE
    - X2AP
    - ENB_APP 
- openair3: 3GPP LTE Rel10 for S1AP, NAS GTPV1-U for both ENB and UE.
    - GTPV1-U
    - NAS 
    - S1AP
    - SCTP
    - SECU
    - UDP
- targets: top level wrapper for unitary simulation for PHY channels, system-level emulation 
   - eNB-UE with and without S1
   - realtime eNB and UE and RRH GW.

#### Refere to https://gitlab.eurecom.fr/oai/openairinterface5g/tree/master for the full source code

