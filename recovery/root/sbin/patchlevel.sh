#!/sbin/sh

finish()
{
	umount /s
	rmdir /s
	setprop crypto.ready 1
	exit 0
}

syspath="/dev/block/bootdevice/by-name/system"
mkdir /s
mount -t ext4 -o ro "$syspath" /s

is_fastboot_twrp=$(getprop ro.boot.fastboot)
if [ ! -z "$is_fastboot_twrp" ]; then
	osver=$(getprop ro.build.version.release_orig)
	patchlevel=$(getprop ro.build.version.security_patch_orig)
    resetprop ro.build.version.release "$osver"
    sed -i "s/ro.build.version.release=.*/ro.build.version.release="$osver"/g" /default.prop ;
    resetprop ro.build.version.security_patch "$patchlevel"
	sed -i "s/ro.build.version.security_patch=.*/ro.build.version.security_patch="$patchlevel"/g" /default.prop ;
	finish
fi

if [ -f /s/build.prop ]; then
	# TODO: It may be better to try to read these from the boot image than from /system
	osver=$(grep -i 'ro.build.version.release' /s/build.prop  | cut -f2 -d'=')
	patchlevel=$(grep -i 'ro.build.version.security_patch' /s/build.prop  | cut -f2 -d'=')
    resetprop ro.build.version.release "$osver"
    sed -i "s/ro.build.version.release=.*/ro.build.version.release="$osver"/g" /default.prop ;
    resetprop ro.build.version.security_patch "$patchlevel"
	sed -i "s/ro.build.version.security_patch=.*/ro.build.version.security_patch="$patchlevel"/g" /default.prop ;
	finish
else
	# Be sure to increase the PLATFORM_VERSION in build/core/version_defaults.mk to override Google's anti-rollback features to something rather insane
	osver=$(getprop ro.build.version.release_orig)
	patchlevel=$(getprop ro.build.version.security_patch_orig)
    resetprop ro.build.version.release "$osver"
    sed -i "s/ro.build.version.release=.*/ro.build.version.release="$osver"/g" /default.prop ;
    resetprop ro.build.version.security_patch "$patchlevel"
	sed -i "s/ro.build.version.security_patch=.*/ro.build.version.security_patch="$patchlevel"/g" /default.prop ;
	finish
fi
