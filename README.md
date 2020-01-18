# knxd
[![Build Status](https://travis-ci.org/s1x/shstack-knxd.svg?branch=master)](https://travis-ci.org/s1x/shstack-knxd)

For documentation and information on the KNXD project [check our their GitHub page](https://github.com/knxd/knxd).

This is a fork of https://github.com/Foxi352 but with a stable alpine version.

## Exposed ports
* 3672/tcp (Server)
* 6720/tcp (KNX-IP)

## Exported files
* /etc/knxd (for knxd.ini file)


## ToDo
Tag docker file with knxd version

```
    TAG=$(docker run fdubuisson/knxd-rpi knxd --version | head -n 1 | cut -d ' ' -f 2 | cut -d ':' -f 1)
    docker tag fdubuisson/knxd-rpi fdubuisson/knxd-rpi:$TAG
    docker push fdubuisson/knxd-rpi:$TAG
```
