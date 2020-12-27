# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Model Ids
# 0PJA10000 - HTC Europe
# 0PJA11000 - AT&T
# 0PJA20000 - Sprint
# 0PJA30000 - Verizon

# OEM Info
BOARD_VENDOR := htc

# Default device path
DEVICE_PATH := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8994
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := $(shell echo $(TARGET_BOOTLOADER_BOARD_NAME) | tr  '[:upper:]' '[:lower:]')
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)

# Kernel
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyHSL0 \
    androidboot.hardware=htc_hima \
    androidboot.selinux=permissive \
    androidkey.dummy=1 \
    androidusb.pid=0x065e \
    boot_cpus=0-5 \
    console=ttyHSL0,115200,n8 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    user_debug=31
BOARD_KERNEL := recovery:0
BOARD_KERNEL_BASE := 0x00078000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_RAMDISK_OFFSET := 0x01f88000
BOARD_KERNEL_TAGS_OFFSET := 0x01d88000
BOARD_MKBOOTIMG_ARGS := --board $(BOARD_KERNEL) --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_KERNEL_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 402653184
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3758096384
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Keymaster
TARGET_HW_DISK_ENCRYPTION := true
BOARD_USES_QCOM_DECRYPTION := true

# Custom Platform Version and Security Patch
# TWRP Defaults
PLATFORM_VERSION := 20.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_MMCUTILS := true

# TWRP Build Flags
TW_THEME := portrait_hdpi
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone7/temp"
TW_DEFAULT_BRIGHTNESS := 125
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.fingerprint"
TW_NO_EXFAT_FUSE := true
TW_USE_TOOLBOX := true

# TWRP Debugging
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/bin/debuggerd
#TARGET_RECOVERY_DEVICE_MODULES += strace
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/xbin/strace

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_$(TARGET_DEVICE)
