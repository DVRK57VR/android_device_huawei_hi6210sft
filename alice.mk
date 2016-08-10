# Android Open Source Project Common Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# AAPT
PRODUCT_AAPT_CONFIG := xhdpi hdpi normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Blobs
$(call inherit-product-if-exists, vendor/huawei/hi6210sft/hi6210sft-vendor.mk)
PRODUCT_RESTRICT_VENDOR_FILES := false

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# File System
PRODUCT_PACKAGES += \
    	make_ext4fs \
    	setup_fs \
	com.android.future.usb.accessory

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    	debug.hwui.render_dirty_regions=false \
 	hw.lcd.lcd_density=320 \
    	ro.opengles.version=131072 \
	ro.sf.lcd_density=320 \
    	persist.sys.strictmode.disable=1 \
    	persist.sys.use_dithering=2 \

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/alice/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/huawei/alice/overlay

# Zygote
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.zygote=zygote64_32

PRODUCT_COPY_FILES += \
	system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.zygote=zygote64_32

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_alice
PRODUCT_DEVICE := alice
