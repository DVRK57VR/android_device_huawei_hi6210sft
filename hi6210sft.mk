# Android Open Source Project Common Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
         debug.sf.no_hw_vsync=1 \
         ro.adb.secure=0 \
         ro.secure=0

# AAPT
PRODUCT_AAPT_CONFIG := xhdpi hdpi normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# APN Long List
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/etc/apns-conf.xml:system/etc/apns-conf.xml

# Audio
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/etc/audio_effects.conf:system/etc/audio_effects.conf \
        $(LOCAL_PATH)/rootdir/etc/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
        audio.a2dp.default \
	audio_policy.stub \
	audio.primary.default \
	audio.r_submix.default \
	audio.usb.default \
	libaudioutils \
	libtinyalsa \
	sound_trigger.primary.hi6210sft \
	tinycap \
	tinymix \
	tinypcminfo \
	tinyplay

# Blobs
$(call inherit-product-if-exists, vendor/huawei/hi6210sft/hi6210sft-vendor.mk)
PRODUCT_RESTRICT_VENDOR_FILES := false

# Charger
PRODUCT_PACKAGES += \
 	charger_res_images

# Codecs
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/etc/hisi_omx.cfg:system/etc/hisi_omx.cfg \
        $(LOCAL_PATH)/rootdir/etc/media_codecs.xml:system/etc/media_codecs.xml \
        $(LOCAL_PATH)/rootdir/etc/media_profiles.xml:system/etc/media_profiles.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml.xml

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
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/mali/lib/egl/libGLES_mali.so:system/lib/egl/libGLES_mali.so \
	$(LOCAL_PATH)/mali/lib/hw/gralloc.hi6210sft.so:system/lib/hw/gralloc.hi6210sft.so \
	$(LOCAL_PATH)/mali/lib/libion.so:system/lib/libion.so \
        $(LOCAL_PATH)/mali/lib64/egl/libGLES_mali.so:system/lib64/egl/libGLES_mali.so \
	$(LOCAL_PATH)/mali/lib64/hw/gralloc.hi6210sft.so:system/lib64/hw/gralloc.hi6210sft.so \
	$(LOCAL_PATH)/mali/lib64/libion.so:system/lib64/libion.so \

PRODUCT_PACKAGES += \
	gralloc.hi6210sft \
	libGLES_android \
	libGLES_mali \
	libion

PRODUCT_PROPERTY_OVERRIDES += \
    	debug.hwui.render_dirty_regions=false \
 	hw.lcd.lcd_density=320 \
    	ro.opengles.version=131072 \
	ro.sf.lcd_density=320 \
    	persist.sys.strictmode.disable=1 \
    	persist.sys.use_dithering=2 \

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/hi6210sft/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Launcher
PRODUCT_PACKAGES += \
 	Launcher3 \

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/huawei/hi6210sft/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
   	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    	audioril.lib=libbalong_audio_ril.so \
	rild.libargs1=-m modem0 \
	rild.libpath=/system/lib/libbalong-ril.so \
	rild.libpath1=/system/lib/libbalong-ril.so \
	rild.libpath2=/system/lib64/libbalong-ril-1.so \
	rild.rild1_ready_to_start=false \
    	ro.telephony.ril_class=HuaweiRIL

PRODUCT_PROPERTY_OVERRIDES += \
	persist.dsds.enabled=true \
	ro.config.dsds_mode=umts_gsm \
	ro.config.hw_dsda=true \
    	ro.telephony.default_network=4 \
    	telephony.lteOnCdmaDevice=0 \
    	telephony.lteOnGsmDevice=1 

# Ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/ramdisk/fstab.hi6210sft:root/fstab.hi6210sft \
        $(LOCAL_PATH)/ramdisk/init:root/init \
        $(LOCAL_PATH)/ramdisk/init.5801.rc:root/init.5801.rc \
        $(LOCAL_PATH)/ramdisk/init.6165.rc:root/init.6165.rc \
        $(LOCAL_PATH)/ramdisk/init.10106.rc:root/init.10106.rc \
        $(LOCAL_PATH)/ramdisk/init.51054.rc:root/init.51054.rc \
        $(LOCAL_PATH)/ramdisk/init.102173.rc:root/init.102173.rc \
        $(LOCAL_PATH)/ramdisk/init.142782.rc:root/init.142782.rc \
        $(LOCAL_PATH)/ramdisk/init.audio.rc:root/init.audio.rc \
        $(LOCAL_PATH)/ramdisk/init.chip.usb.rc:root/init.chip.usb.rc \
        $(LOCAL_PATH)/ramdisk/init.connectivity.bcm43xx.rc:root/init.connectivity.bcm43xx.rc \
        $(LOCAL_PATH)/ramdisk/init.connectivity.hi110x.rc:root/init.connectivity.hi110x.rc \
        $(LOCAL_PATH)/ramdisk/init.connectivity.rc:root/init.connectivity.rc \
        $(LOCAL_PATH)/ramdisk/init.device.rc:root/init.device.rc \
        $(LOCAL_PATH)/ramdisk/init.extmodem.rc:root/init.extmodem.rc \
        $(LOCAL_PATH)/ramdisk/init.hi6210sft.rc:root/init.hi6210sft.rc \
        $(LOCAL_PATH)/ramdisk/init.hisi.rc:root/init.hisi.rc \
        $(LOCAL_PATH)/ramdisk/init.manufacture.rc:root/init.manufacture.rc \
        $(LOCAL_PATH)/ramdisk/init.performance.rc:root/init.performance.rc \
        $(LOCAL_PATH)/ramdisk/init.platform.rc:root/init.platform.rc \
        $(LOCAL_PATH)/ramdisk/init.protocol.rc:root/init.protocol.rc \
        $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
        $(LOCAL_PATH)/ramdisk/init.tee.rc:root/init.tee.rc \
        $(LOCAL_PATH)/ramdisk/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc \

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/ramdisk/sbin/check_root:root/sbin/check_root \
        $(LOCAL_PATH)/ramdisk/sbin/e2fsck_s:root/sbin/e2fsck_s \
        $(LOCAL_PATH)/ramdisk/sbin/emmc_partation:root/sbin/emmc_partation \
        $(LOCAL_PATH)/ramdisk/sbin/kmsgcat:root/sbin/kmsgcat \
        $(LOCAL_PATH)/ramdisk/sbin/logctl_service:root/sbin/logctl_service \
        $(LOCAL_PATH)/ramdisk/sbin/oeminfo_nvm_server:root/sbin/oeminfo_nvm_server \
        $(LOCAL_PATH)/ramdisk/sbin/teecd:root/sbin/teecd \

# Recovery
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/recovery/init.recovery.hi110x.rc:root/init.recovery.hi110x.rc \
        $(LOCAL_PATH)/recovery/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc

# WIFI
PRODUCT_PROPERTY_OVERRIDES += \
    	wifi.interface=wlan0 \
    	wifi.supplicant_scan_interval=15

# Zygote
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.zygote=zygote64_32

PRODUCT_COPY_FILES += \
	system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.zygote=zygote64_32

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_hi6210sft
PRODUCT_DEVICE := hi6210sft
