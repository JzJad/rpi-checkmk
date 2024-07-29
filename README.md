# CheckMK-ARM
[![Docker](https://github.com/JzJad/rpi-checkmk/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/JzJad/rpi-checkmk/actions/workflows/docker-publish.yml)

## Current version: 2.2.0p22 (Updates on hold)

As mentioned on [chrisss404's](https://github.com/chrisss404/check-mk-arm) readme, there is an official commitment to add support for certain ARM architectures by Checkmk: [Checkmk – our road to ARM support.](https://checkmk.com/blog/checkmk-our-road-arm-support) as this is the case they have retired the project, as such there will be no more updates to the base image at this moment.

---

checkmk as a docker container for ARM[v7/v8]/ devices such as the raspberry pi, and Oracle Ampere A1 Compute.



### arm64[v8/aarch64] (Based on ubuntu:jammy)

[Compose File](https://github.com/JzJad/rpi-checkmk/blob/master/docker-compose-ARMv8.yml)

Docker run command

`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 -p 8000:8000 ghcr.io/jzjad/rpi-checkmk-arm64:latest`




### arm32[v7/hf] (Based on debian:bullseye, please note this version is behind and will likely not be updated again.)

[Compose File](https://github.com/JzJad/rpi-checkmk/blob/master/docker-compose-ARMv7.yml)

Docker run command

`sudo docker run -d --name checkmk -v /opt/omd/sites:/opt/omd/sites -p 5000:5000 -p 8000:8000 ghcr.io/jzjad/rpi-checkmk-armhf:latest`

### Update from an older version

`sudo docker exec -it checkmk /bin/sh -c "curl https://raw.githubusercontent.com/JzJad/rpi-checkmk/master/upgrade.sh | bash"`



## TODO
- [ ] Await official ARM packages!
