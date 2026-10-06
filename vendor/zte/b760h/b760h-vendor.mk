# Minimal vendor makefile for the ZTE B760H device tree.
#
# The original upstream device tree expects a generated vendor makefile at:
#   vendor/zte/b760h/b760h-vendor.mk
#
# The repository contains the proprietary blobs under:
#   vendor/zte/b760h/proprietary
#
# This file provides the required product config entry so the Android build can
# resolve the vendor product definition. The real device blob extraction normally
# happens via setup-makefiles.sh / extract-files.sh, but those generated files
# are not present in this stripped-down repo snapshot.

LOCAL_PATH := $(call my-dir)

# Keep the vendor blob set visible to the build.
# The blob directory already contains the MTK/zte proprietary payloads used by the
# device tree, so we map the files into the target image at the product level.
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*, $(LOCAL_PATH)/proprietary, system)

# The stock Lineage device config also expects the vendor path to exist for the
# device-specific product definition.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.platform=mt8127 \
    ro.product.model=B760H \
    ro.product.vendor=zte
