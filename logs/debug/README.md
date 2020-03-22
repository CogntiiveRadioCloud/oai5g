### Testing OAI ``` master ``` branch based on USRP NI-2944 Rio 

> No S1 Interface, only access network is running

> Specs:

- Ubuntu 18.04.4 LTS 
- Intel Core i7
- Memory 10 GB 
- UHD version: UHD_3.14.1.1-release
- Kernel: 5.3.0-28-lowlatency 
- 1Gb Ethernet 
- Variable Attenuators (0 dB to 60 dB) 

> Main Isuues:

- UE doesn't synch on UL and Doens't attach to the network


> Test1:

- eNB has a real-time issue

> Test2

- eNB is running fine without real-time issue, but UE side deosn't attach and possible fw corruption.

> RUN

```bash
sudo -E ./lte_build_oai/build/lte-softmodem -O ~/openairinterface5g/ci-scripts/conf_files/ci-enb.band7.tm1.25PRB.NI-2944.conf --nokrnmod 0 --noS1 --eNBs.[0].rrc_inactivity_threshold 0 2>&1 | tee ENB.log

```

```bash
sudo ./lte-uesoftmodem -C 2680000000 -r 25 --ue-rxgain 120 --ue-txgain 40 --ue-max-power 0 --ue-scan-carrier --nokrnmod 1 --noS1 2>&1 | tee UE.log

```
