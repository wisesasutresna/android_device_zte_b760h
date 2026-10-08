LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := AptoideTV
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED

# Same reason as SmartTube: cm-14.1's dex2oat aborts in
# CheckVTableHasNoDuplicates on these store-downloaded APKs.
LOCAL_DEX_PREOPT := false

include $(BUILD_PREBUILT)