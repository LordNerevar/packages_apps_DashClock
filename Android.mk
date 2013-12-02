LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# work-around dashclock missing hdpi resources bug
LOCAL_AAPT_INCLUDE_ALL_RESOURCES := true

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-v4 \
    android-support-v13 \
    play

LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/, res)
LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_SRC_FILES += \
        src/com/google/android/apps/dashclock/api/IDashClockDataProvider.aidl \
        src/com/google/android/apps/dashclock/api/internal/IExtensionHost.aidl \
        src/com/google/android/apps/dashclock/api/internal/IExtension.aidl

LOCAL_PACKAGE_NAME := DashClock

LOCAL_JAVA_LIBRARIES := telephony-common

# Include res dir from chips
google_play_dir := ../../../external/google/google_play_services/libproject/google-play-services_lib/res
res_dir := $(google_play_dir) res

LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/, $(res_dir))
LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_AAPT_FLAGS += --extra-packages com.google.android.gms

include $(BUILD_PACKAGE)

# Use the following include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))
