#!/bin/bash

#Dummy dependency test
run_install()
{
    ## Prompt the user 
    read -p "Do you want to check for missing Packages before setting the LT-Kernal? [Y/n]: " answer
    answer=${answer:Y}
    [[ $answer =~ [Yy] ]] && apt install ${boostlibnames[@]}
}

boostlibnames=("dpkg-dev")
## Run the run_install function if sany of the libraries are missing
dpkg -s "${boostlibnames[@]}" >/dev/null 2>&1 || run_install


printf "[INST]    Low Latency Kernal installation ...\n"
sudo apt install linux-lowlatency

printf "[GIT]     ubuntustudio-default-settings 18.04 LTS ...\n"
#cd /usr/src/ || exit;
sudo wget -q http://za.archive.ubuntu.com/ubuntu/pool/universe/u/ubuntustudio-default-settings/ubuntustudio-default-settings_0.64_all.deb

printf "[EXTR]    Extract files in ubuntustudio-default-settings_0.64_all.deb ...\n"
dpkg -x  ubuntustudio-default-settings_0.64_all.deb ubuntustudio-default-settings_0.64_all

printf "[MOVE]    Move 09_lowlatency grub configuration to grub.d to assure its presistant across reboot ...\n"
sudo cp ubuntustudio-default-settings_0.64_all/etc/grub.d/09_lowlatency /etc/grub.d/

printf "[UPDA]    Update System Grub configuration ....\n"
sudo update-grub
