#!/sbin/sh

touch /thisworked
hexdump -v -s 0x578 -n 8 /dev/block/bootdevice/by-name/system | grep "0000 0000 0000 0000" && mv /etc/recovery.fstab.system_ro /etc/recovery.fstab;
