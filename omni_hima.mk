## Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/cdma.mk)

# Inherit device configuration
$(call inherit-product, device/htc/hima/full_hima.mk)
# Release name
PRODUCT_RELEASE_NAME := hima

# Inherit some common DU stuff.
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hima
PRODUCT_NAME := omni_hima
PRODUCT_BRAND := htc
PRODUCT_MODEL := hima
PRODUCT_MANUFACTURER := htc
