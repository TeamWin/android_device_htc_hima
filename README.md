TeamWin Recovery Project

Device files for HTC One (M9)
Codename: Hima

Builds with OmniROM android-5.1 tree

cat proc/emmc:
dev:        size     erasesize name
mmcblk0p1: 00004000  00000200  "board_info"
mmcblk0p2: 00400000  00000200  "pg1fs"
mmcblk0p3: 00100000  00000200  "sbl1"
mmcblk0p4: 00100000  00000200  "pmic"
mmcblk0p5: 02800000  00000200  "dummy"
mmcblk0p6: 001f7c00  00000200  "reserve_1"
mmcblk0p7: 00040000  00000200  "mfg"
mmcblk0p8: 017afc00  00000200  "pg2fs"
mmcblk0p9: 00080000  00000200  "rpm"
mmcblk0p10: 00200000  00000200  "tz"
mmcblk0p11: 00018000  00000200  "sdi"
mmcblk0p12: 00200000  00000200  "hyp"
mmcblk0p13: 00100000  00000200  "aboot"
mmcblk0p14: 00a00000  00000200  "tool_diag"
mmcblk0p15: 00a00000  00000200  "sp1"
mmcblk0p16: 00100000  00000200  "ddr"
mmcblk0p17: 00100000  00000200  "rfg_0"
mmcblk0p18: 00100000  00000200  "rfg_1"
mmcblk0p19: 00100000  00000200  "rfg_2"
mmcblk0p20: 00100000  00000200  "rfg_3"
mmcblk0p21: 00100000  00000200  "rfg_4"
mmcblk0p22: 00100000  00000200  "rfg_5"
mmcblk0p23: 00100000  00000200  "rfg_6"
mmcblk0p24: 00100000  00000200  "rfg_7"
mmcblk0p25: 00180000  00000200  "fsg"
mmcblk0p26: 03b00400  00000200  "radio"
mmcblk0p27: 01400000  00000200  "adsp"
mmcblk0p28: 00000400  00000200  "limits"
mmcblk0p29: 004f7c00  00000200  "reserve_2"
mmcblk0p30: 01600000  00000200  "persist"
mmcblk0p31: 00a00000  00000200  "ramdump"
mmcblk0p32: 00100000  00000200  "misc"
mmcblk0p33: 00180000  00000200  "modem_st1"
mmcblk0p34: 00180000  00000200  "modem_st2"
mmcblk0p35: 01400000  00000200  "fataldevlog"
mmcblk0p36: 01e00000  00000200  "devlog"
mmcblk0p37: 00040000  00000200  "pdata"
mmcblk0p38: 00004000  00000200  "control"
mmcblk0p39: 00010000  00000200  "extra"
mmcblk0p40: 00100000  00000200  "cdma_record"
mmcblk0p41: 00000400  00000200  "fsc"
mmcblk0p42: 00002000  00000200  "ssd"
mmcblk0p43: 00080000  00000200  "sensor_hub"
mmcblk0p44: 00020000  00000200  "sec"
mmcblk0p45: 00100000  00000200  "abootbak"
mmcblk0p46: 00002800  00000200  "cir_img"
mmcblk0p47: 00140400  00000200  "local"
mmcblk0p48: 00080000  00000200  "frp"
mmcblk0p49: 00200000  00000200  "cpe"
mmcblk0p50: 01400000  00000200  "reserve_3"
mmcblk0p51: 00040000  00000200  "skylink"
mmcblk0p52: 00020000  00000200  "rfg_8"
mmcblk0p53: 00020000  00000200  "rfg_9"
mmcblk0p54: 00020000  00000200  "rfg_10"
mmcblk0p55: 00020000  00000200  "rfg_11"
mmcblk0p56: 00020000  00000200  "rfg_12"
mmcblk0p57: 00020000  00000200  "rfg_13"
mmcblk0p58: 00020000  00000200  "rfg_14"
mmcblk0p59: 00020000  00000200  "rfg_15"
mmcblk0p60: 00a00000  00000200  "battery"
mmcblk0p61: 00407000  00000200  "reserve"
mmcblk0p62: 04000000  00000200  "hosd"
mmcblk0p63: 04000000  00000200  "boot"
mmcblk0p64: 04000000  00000200  "recovery"
mmcblk0p65: 14000000  00000200  "cache"
mmcblk0p66: 18000000  00000200  "system"
mmcblk0p67: e0000000  00000200  "userdata"
mmcblk0p68: 12200000  00000200  "apppreload"
mmcblk0p69: 03c00000  00000200  "cota"
mmcblk0p70: 02d00000  00000200  "carrier"
mmcblk0p71: 01000000  00000200  "absolute"

cat proc/partitions:
major minor  #blocks  name

 179        0   30535680 mmcblk0
 179        1         16 mmcblk0p1
 179        2       4096 mmcblk0p2
 179        3       1024 mmcblk0p3
 179        4       1024 mmcblk0p4
 179        5      40960 mmcblk0p5
 179        6       2015 mmcblk0p6
 179        7        256 mmcblk0p7
 179        8      24255 mmcblk0p8
 179        9        512 mmcblk0p9
 179       10       2048 mmcblk0p10
 179       11         96 mmcblk0p11
 179       12       2048 mmcblk0p12
 179       13       1024 mmcblk0p13
 179       14      10240 mmcblk0p14
 179       15      10240 mmcblk0p15
 259        0       1024 mmcblk0p16
 259        1       1024 mmcblk0p17
 259        2       1024 mmcblk0p18
 259        3       1024 mmcblk0p19
 259        4       1024 mmcblk0p20
 259        5       1024 mmcblk0p21
 259        6       1024 mmcblk0p22
 259        7       1024 mmcblk0p23
 259        8       1024 mmcblk0p24
 259        9       1536 mmcblk0p25
 259       10      60417 mmcblk0p26
 259       11      20480 mmcblk0p27
 259       12          1 mmcblk0p28
 259       13       5087 mmcblk0p29
 259       14      22528 mmcblk0p30
 259       15      10240 mmcblk0p31
 259       16       1024 mmcblk0p32
 259       17       1536 mmcblk0p33
 259       18       1536 mmcblk0p34
 259       19      20480 mmcblk0p35
 259       20      30720 mmcblk0p36
 259       21        256 mmcblk0p37
 259       22         16 mmcblk0p38
 259       23         64 mmcblk0p39
 259       24       1024 mmcblk0p40
 259       25          1 mmcblk0p41
 259       26          8 mmcblk0p42
 259       27        512 mmcblk0p43
 259       28        128 mmcblk0p44
 259       29       1024 mmcblk0p45
 259       30         10 mmcblk0p46
 259       31       1281 mmcblk0p47
 259       32        512 mmcblk0p48
 259       33       2048 mmcblk0p49
 259       34      20480 mmcblk0p50
 259       35        256 mmcblk0p51
 259       36        128 mmcblk0p52
 259       37        128 mmcblk0p53
 259       38        128 mmcblk0p54
 259       39        128 mmcblk0p55
 259       40        128 mmcblk0p56
 259       41        128 mmcblk0p57
 259       42        128 mmcblk0p58
 259       43        128 mmcblk0p59
 259       44      10240 mmcblk0p60
 259       45       4124 mmcblk0p61
 259       46      65536 mmcblk0p62
 259       47      65536 mmcblk0p63
 259       48      65536 mmcblk0p64
 259       49     327680 mmcblk0p65
 259       50    4587520 mmcblk0p66
 259       51   24641536 mmcblk0p67
 259       52     296960 mmcblk0p68
 259       53      61440 mmcblk0p69
 259       54      46080 mmcblk0p70
 259       55      16384 mmcblk0p71
 179       16       4096 mmcblk0rpmb
 179       32   62367744 mmcblk1
 179       33   45589504 mmcblk1p1
 179       34   16777216 mmcblk1p2

cat proc/mounts (in recovery):
rootfs / rootfs rw 0 0
tmpfs /dev tmpfs rw,seclabel,nosuid,relatime,mode=755 0 0
devpts /dev/pts devpts rw,seclabel,relatime,mode=600 0 0
proc /proc proc rw,relatime 0 0
sysfs /sys sysfs rw,seclabel,relatime 0 0
selinuxfs /sys/fs/selinux selinuxfs rw,relatime 0 0
tmpfs /tmp tmpfs rw,seclabel,relatime 0 0
pstore /sys/fs/pstore pstore rw,relatime 0 0
adb /dev/usb-ffs/adb functionfs rw,relatime 0 0
/dev/block/bootdevice/by-name/devlog /devlog ext4 rw,seclabel,nosuid,nodev,relatime,errors=continue,data=ordered 0 0
/dev/block/mmcblk0p65 /cache ext4 rw,seclabel,relatime,data=ordered 0 0
/dev/block/mmcblk1p1 /external_sd fuseblk rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other,max_read=131072,blksize=4096 0 0
/dev/block/mmcblk1p1 /and-sec fuseblk rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other,max_read=131072,blksize=4096 0 0
/dev/block/mmcblk0p67 /data ext4 rw,seclabel,relatime,data=ordered 0 0
/dev/block/mmcblk0p67 /sdcard ext4 rw,seclabel,relatime,data=ordered 0 0
