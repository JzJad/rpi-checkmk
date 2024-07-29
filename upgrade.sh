#!/bin/bash
DEBIAN_FRONTEND="noninteractive"
ARCH=$(dpkg --print-architecture)
CODENAME=$(env -i bash -c '. /etc/os-release; echo $VERSION_CODENAME')
Version=$(/usr/bin/omd version Monitor | cut -c 43-)



if [ "$Version" == "2.2.0p22.cre" ];
then
    echo "Already on the latest version: 2.2.0p22"
    exit 1
else
    echo "Current Version: $Version"
    echo "New Version: 2.2.0p22"
    echo "Starting upgrade process 
fi

mkdir /app/backups -p
echo "Creating a site backup located at: /app/backups/updatebackup.tar"
/usr/bin/omd backup Monitor /app/backups/updatebackup.tar


curl https://raw.githubusercontent.com/JzJad/rpi-checkmk/master/get-package.sh | bash

dpkg -i check-mk-raw-*.${CODENAME}_${ARCH}.deb || true
rm check-mk-raw-*.${CODENAME}_${ARCH}.deb

/usr/bin/omd stop
/usr/bin/omd update monitoring
/usr/bin/omd start
/usr/bin/omd cleanup
