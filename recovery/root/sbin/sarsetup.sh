#!/sbin/sh

SCRIPTNAME="SAR_Setup"
LOGFILE=/tmp/recovery.log

log_info()
{
	echo "I:$SCRIPTNAME:$1" >> "$LOGFILE"
}

log_error()
{
	echo "E:$SCRIPTNAME:$1" >> "$LOGFILE"
}

finish()
{
	log_info "SAR setup complete. Continuing TWRP boot."
	exit 0
}

sar=$(getprop ro.twrp.sar)

log_info "Running system-as-root (SAR) setup script for TWRP..."

if [ "$sar" = "true" ]; then
	log_info "Device uses SAR setup. Setting up recovery fstab for SAR..."
	sed -i 's;^/preload\([\s\t]*\)\([^\s\t]*\)\(.*\);/vendor\t\1\2\3\n\/vendor_image\1emmc\3;g' /etc/recovery.fstab
	finish
else
	log_info "Device uses legacy system setup. No further action required."
	finish
fi
