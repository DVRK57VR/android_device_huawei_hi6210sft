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

# Binaries
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/bin/agnsscontrol:system/bin/agnsscontrol \
        $(LOCAL_PATH)/rootdir/bin/agnsslog:system/bin/agnsslog \
        $(LOCAL_PATH)/rootdir/bin/akmd09911:system/bin/akmd09911 \
        $(LOCAL_PATH)/rootdir/bin/atcmdserver:system/bin/atcmdserver \
        $(LOCAL_PATH)/rootdir/bin/data_cleaner:system/bin/data_cleaner \
        $(LOCAL_PATH)/rootdir/bin/device_monitor:system/bin/device_monitor \
        $(LOCAL_PATH)/rootdir/bin/glgps:system/bin/glgps \
        $(LOCAL_PATH)/rootdir/bin/gnss_engine:system/bin/gnss_engine \
        $(LOCAL_PATH)/rootdir/bin/gpsdaemon:system/bin/gpsdaemon \
        $(LOCAL_PATH)/rootdir/bin/hisi_connectivity.sh:system/bin/hisi_connectivity.sh \
        $(LOCAL_PATH)/rootdir/bin/hostapd_cli_hisi:system/bin/hostapd_cli_hisi \
        $(LOCAL_PATH)/rootdir/bin/hostapd_hisi:system/bin/hostapd_hisi \
        $(LOCAL_PATH)/rootdir/bin/mac_addr_normalization:system/bin/mac_addr_normalization \
        $(LOCAL_PATH)/rootdir/bin/modemlogcat_lte:system/bin/modemlogcat_lte \
        $(LOCAL_PATH)/rootdir/bin/modem_resetinfo:system/bin/modem_resetinfo \
        $(LOCAL_PATH)/rootdir/bin/oam_app:system/bin/oam_app \
        $(LOCAL_PATH)/rootdir/bin/octty:system/bin/octty \
        $(LOCAL_PATH)/rootdir/bin/preparesd.sh:system/bin/preparesd.sh \
        $(LOCAL_PATH)/rootdir/bin/set_log:system/bin/set_log \
        $(LOCAL_PATH)/rootdir/bin/start_110x_service.sh:system/bin/start_110x_service.sh \
        $(LOCAL_PATH)/rootdir/bin/wpa_cli_hisi:system/bin/wpa_cli_hisi \
        $(LOCAL_PATH)/rootdir/bin/wpa_supplicant_hisi:system/bin/wpa_supplicant_hisi \

# Blobs
$(call inherit-product-if-exists, vendor/huawei/hi6210sft/hi6210sft-vendor.mk)
PRODUCT_RESTRICT_VENDOR_FILES := false

# Bluetooth
#PRODUCT_COPY_FILES += \
#        $(LOCAL_PATH)/bluetooth/auto_pair_devlist.conf:system/etc/bluetoot/auto_pair_devlist.conf \
#        $(LOCAL_PATH)/bluetooth/bt_did.conf:system/etc/bluetoot/bt_did.conf \
#        $(LOCAL_PATH)/bluetooth/bt_stack.conf:system/etc/bluetoot/bt_stack.conf \
#        $(LOCAL_PATH)/bluetooth/bt_stack_log.conf:system/etc/bluetoot/bt_stack_log.conf \
#        $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetoot/bt_vendor.conf \

# Boot
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/isp.bin:system/isp.bin \
        $(LOCAL_PATH)/rootdir/ons.bin:system/ons.bin \
        $(LOCAL_PATH)/rootdir/phone.prop:system/phone.prop \

# Charger
PRODUCT_PACKAGES += \
 	charger_res_images

# Connectivity
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/huawei/hi6210sft/rootdir/vendor/firmware/,system/vendor/firmware)

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

# modemConfig
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/huawei/hi6210sft/rootdir/etc/modemConfig/,system/etc/modemConfig) \
        $(LOCAL_PATH)/rootdir/etc/android_panic.sh:system/etc/android_panic.sh \

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/huawei/hi6210sft/overlay

# Permissions
PRODUCT_COPY_FILES += \
    	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# RIL
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/lib/libbalong_audio_ril.so:system/lib/libbalong_audio_ril.so \
        $(LOCAL_PATH)/rootdir/lib/libbalong-ril.so:system/lib/libbalong-ril.so \
        $(LOCAL_PATH)/rootdir/lib/libbalong-ril-1.so:system/lib/libbalong-ril-1.so \
        $(LOCAL_PATH)/rootdir/lib64/libbalong_audio_ril.so:system/lib64/libbalong_audio_ril.so \
        $(LOCAL_PATH)/rootdir/lib64/libbalong-ril.so:system/lib64/libbalong-ril.so \
        $(LOCAL_PATH)/rootdir/lib64/libbalong-ril-1.so:system/lib64/libbalong-ril-1.so \

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
