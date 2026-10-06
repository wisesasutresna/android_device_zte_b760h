# Minimal vendor makefile for the ZTE B760H device tree.
# Generated to satisfy the product config dependency used by:
#   device/zte/b760h/device.mk
#
# This file is required because the device tree expects:
#   $(call inherit-product, $(VENDOR_PATH)/b760h-vendor.mk)
#
# The actual proprietary blobs are expected under:
#   vendor/zte/b760h/proprietary

LOCAL_PATH := $(call my-dir)

# Expose the device's proprietary files to the product build.
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*, $(LOCAL_PATH)/proprietary, system)

# Device metadata for the build.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.platform=mt8127 \
    ro.product.model=B760H \
    ro.product.vendor=zte
