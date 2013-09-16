#!/bin/bash

sudo rm -rf /mnt/usb
sudo mkdir /mnt/usb

sudo mount /dev/sdb4 /mnt/usb
cd /mnt/usb
ls

