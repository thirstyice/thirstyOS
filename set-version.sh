#!/bin/bash

echo "Version number:"
read version
if [[ $version != no ]]; then
	echo "DISTRIB_ID=thirstyOS
	DISTRIB_DESCRIPTION=thirstyOS $version
	DISTRIB_RELEASE=$version
	DISTRIB_CODENAME=$version">config/includes.chroot/etc/lsb-release
	
	echo "thirstyOS $version \n \l" > config/includes.chroot/etc/issue
	
	echo "thirstyOS $version" > config/includes.chroot/etc/issue.net
	
	git add \
		config/includes.chroot/etc/lsb-release \
		config/includes.chroot/etc/issue \
		config/includes.chroot/etc/issue.net
	
	git commit -m "Updated version number to $version"
fi
