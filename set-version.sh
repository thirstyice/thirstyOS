#!/bin/bash

echo "Version number:"
read version
if [[ $version != no ]]; then
	echo "DISTRIB_ID=thirstyos
	DISTRIB_DESCRIPTION=thirstyos $version
	DISTRIB_RELEASE=$version
	DISTRIB_CODENAME=$version">config/includes.chroot/etc/lsb-release
	git add config/includes.chroot/etc/lsb-release
	git commit -m "Updated version number in lsb-release to $version"
fi
