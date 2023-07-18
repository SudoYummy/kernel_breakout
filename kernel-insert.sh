#!/bin/bash

if lsmod | grep -o -q "reverse_shell"; then rmmod reverse-shell; fi
insmod reverse-shell.ko
rmmod reverse-shell