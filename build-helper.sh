#/bin/sh

echo "Device:"
read device

sudo su -s /bin/bash -c "
echo \"

configuring\"
echo -e \"\e[96m\"
lb config --verbose;
echo -e \"\e[0m
config done, building
\e[95m\"; 
lb build --verbose; 
echo -e \"\e[0m
build done, clearing usb
\e[94m\"; 
dd if=/dev/zero of=$device bs=4M;
sync;
echo -e \"\e[0m
cleared, copying iso
\e[93m\"; 
dd if=live-image-amd64.hybrid.iso of=$device bs=4M; 
sync;
echo -e \"\e[0m
done!
\";
"
