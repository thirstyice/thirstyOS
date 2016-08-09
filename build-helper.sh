#/bin/sh

## This assumes that your usb is /dev/sdc

lb config --verbose;
 echo -e "\e[95m
config done, building
\e[0m"; 
lb build --verbose; 
echo -e "\e[95m
build done, clearing usb
\e[0m"; 
dd if=/dev/zero of=/dev/sdc bs=4M;
sync;
echo -e "\e[95m
cleared, copying iso
\e[0m"; 
dd if=live-image-i386.hybrid.iso of=/dev/sdc bs=4M; 
sync;
echo -e "\e[95m
copied, cleanng
\e[0m";
lb clean --verbose;
