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

