LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := SmartTube
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED

# ART in Nougat aborts in CheckVTableHasNoDuplicates while dexing this APK:
#   art::CheckVTableHasNoDuplicates
#     /proc/self/cwd/art/runtime/class_linker.cc:6618 -> Runtime::Abort
#   .../dex2oatd --dex-file=.../apps/SmartTube/SmartTube.apk
#   make: *** [build/core/ninja.mk:152: ninja_wrapper] Error 134
# The app is compiled against a much newer SDK than cm-14.1's dex2oat
# understands. Prebuilt APKs run from their dex at runtime anyway, so
# skipping the ahead-of-time step only costs a little startup latency.
LOCAL_DEX_PREOPT := false

include $(BUILD_PREBUILT)