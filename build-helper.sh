#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	sudo $0 $@
	exit
fi
echo "Device:"
read device
echo -e "clearing usb in background"
dd if=/dev/zero of=$device bs=4M &
pid=$!
echo "pid is $pid"
echo -e "\e[0m
configuring
\e[96m"
lb config --verbose
echo -e "\e[0m
config done, building
\e[95m"
lb build --verbose
echo -e "\e[0m
build done, verifying usb cleared
\e[94m"
wait $pid
sync
echo -e "\e[0m
usb cleared, copying iso
\e[93m"
dd if=live-image-amd64.hybrid.iso of=$device bs=4M
sync
echo -e "\e[0m
done!
"
