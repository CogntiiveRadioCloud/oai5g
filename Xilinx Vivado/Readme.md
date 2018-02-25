The Verilog code for the FPGA in the USRP X300 and USRP X310 could be loaded by using uhd scripts
```bash
uhd_image_downloader
```
To load the image:
```bash
uhd_image_loader --args="type=x300,addr=192.168.10.2,fpga=HG"
```
regarding that OAIimages to a non-standard location we use the following script including the path, instead:
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

##### But Due to some aggreaments and control policies, it impossible to maintain an online account in some E or D category countries.
[Regulations Doc](https://www.bis.doc.gov/index.php/forms-documents/regulations-docs/federal-register-notices/federal-register-2014/944-740-supp-1/file)

You have to change the proxy configuration, and create an account from scratch (Hint: Fill personal/geo information based on your IP location)
######## Hint
You can't log again from another location/proxy/ip

## Download 
https://mega.nz/#!dTR11RKK!RI_NxkXA8CpvsnSt7ho5XyFvdgab4VKjDiJ2-2-IPNs

## Procedures to Flash the USRP
https://kb.ettus.com/X300/X310_Device_Recovery
