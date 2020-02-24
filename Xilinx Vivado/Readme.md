The Verilog code for the FPGA in the USRP X300 and USRP X310 could be loaded by using uhd scripts
```bash
uhd_image_downloader
```
To load the image:
```bash
uhd_image_loader --args="type=x300,addr=192.168.10.2,fpga=HG"
```
regarding that OAI fetch uhd images to a non-standard location we use the following script including the path, instead:
```bash
uhd_image_loader --args="type=x300,addr=192.168.10.2" --fpga-path="<path_to_images>/usrp_x310_fpga_HG.bit"
```
to check if successfully installed, run
```bash
uhd_usrp_probe
```

Where certain operations may result in corrupting the firmware image, like interapting the loading process:  You have to Recover the device and flash it with a safe image using JTAG Interface.

You will need to download and install Xilinx Vivado Lab Edition 2015.4 in order to flash the USRP X300 via JTAG. Xilinx Vivado Lab Edition 2015.4 can be downloaded at the following link: 
[xilinx vivado](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)

#### But Due to some aggreaments and control policies, it impossible to maintain an online account in some E or D category countries.
[Regulations Doc](https://www.bis.doc.gov/index.php/forms-documents/regulations-docs/federal-register-notices/federal-register-2014/944-740-supp-1/file)

You have to change the proxy configuration, and create an account from scratch (Hint: Fill personal/geo information based on your IP location)
#### Hint
You can't log again from another location/proxy/ip

## Download 
https://mega.nz/#!dTR11RKK!RI_NxkXA8CpvsnSt7ho5XyFvdgab4VKjDiJ2-2-IPNs

1st: Make Sure That USRP x300 Images are already existed
```
   ls -alh /usr/local/share/uhd/images/usrp_x3*
```
2nd: Navigate to Xilinx Vivado Location & Launch the installer
```
   cd Xilinx_Vivado_Lab_Lin_2015.4_1118_2
   sudo ./xsetup
```
You will be prompted that a newer version is available, ## ignore this popup and click Continue to install Xilinx Vivado Lab 2015.4. and Complete the Installation

3rd: Connect the USRP x300 via JTAG and Start the Xilinx
```
   /opt/Xilinx/Vivado_Lab/2015.4/bin/vivado_lab
```
4th:  Open the Hardware Manager 
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx1.png?raw=true"/>
</p>

Next, within the menu the of the Hardware Manager select Tools -> Auto Connect
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx2.png?raw=true"/>
</p>

###### you will nofice the details of the FPGA should populate the window on the left side of the Hardware Manager. 
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx3.png?raw=true"/>
</p>

 Right click on the FPGA listed, and select Program Device. 

<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx4.png?raw=true"/>
</p>

from /usr/local/share/uhd/images
 Select the correct FPGA image _x300
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx5.png?raw=true"/>
</p>
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx6.png?raw=true"/>
</p>
<p align="center">
  <img src="https://github.com/astro7x/oai5g/blob/master/Xilinx Vivado/imgs/xilinx7.png?raw=true"/>
</p>

 Once the programming is completed, close Vivado Lab. 
 
    ping 192.168.10.2
    
    uhd_usrp_probe
    
    uhd_image_loader --args="type=x300,addr=192.168.10.2" --fpga-path="usr/local/share/usrp_x300_fpga_HG.bit"
    
## Procedures to Flash the USRP
https://kb.ettus.com/X300/X310_Device_Recovery
