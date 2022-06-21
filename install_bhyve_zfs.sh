#! /bin/bash

echo "Install bhyve management"

pkg install -y vm-bhyve grub2-bhyve bhyve-firmware uefi-edk2-bhyve

kldload vmm

sysrc vm_enable="YES"

echo "Configure bhyve storage"

zfs create zroot/vm
zfs set mountpoint=/vm zroot/vm
sysrc vm_dir="zfs:zroot/vm"

echo "Initilize basic configuration"

vm init
cp /usr/local/share/examples/vm-bhyve/* /vm/.templates/

echo "Configure bhyve network"

vm switch create public
vm switch add public wlan0
