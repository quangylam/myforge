#!/bin/sh
/etc/init.d/services/dhcp stop
ifconfig eth1 192.168.22.100 netmask 255.255.255.0 broadcast 192.168.10.255 up

[ -d "/mnt/sdb1/lost+found" ] || mount /mnt/sdb1

cp -p /etc/resolv.conf /etc/resolv.conf.0
grep search /etc/resolv.conf.0 >/etc/resolv.conf
echo "nameserver 192.168.22.100" >>/etc/resolv.conf
grep nameserver /etc/resolv.conf.0 >>/etc/resolv.conf

filetool.sh -r sda1/tce

