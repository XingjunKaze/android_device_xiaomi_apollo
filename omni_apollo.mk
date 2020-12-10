#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Release name
PRODUCT_RELEASE_NAME := apollo
DEVICE_PATH := device/xiaomi/apollo

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := apollo
PRODUCT_NAME := omni_apollo
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K30S Ultra
PRODUCT_MANUFACTURER := Xiaomi

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="apollo-user 10 QKQ1.200419.002 V12.0.5.0.QJDCNXM release-keys"

BUILD_FINGERPRINT="Redmi/apollo/apollo:10/QKQ1.200419.002/V12.0.5.0.QJDCNXM:user/release-keys"

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/dtb:dtb.img

TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
    $(DEVICE_PATH)/recovery/root/system/lib64/libion.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libxml2.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libicuuc.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libicui18n.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/libashmemd_client.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/ashmemd_aidl_interface-cpp.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/android.hardware.boot@1.0.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/android.hardware.fastboot@1.0.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/android.hidl.base@1.0.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/android.hidl.token@1.0.so \
    $(DEVICE_PATH)/recovery/root/system/lib64/magiskboot \
    $(DEVICE_PATH)/recovery/root/system/lib64/hw/aandroid.hardware.fastboot@1.0-impl-mock.so \
    $(DEVICE_PATH)/recovery/root/sbin/android.hardware.gatekeeper@1.0-service-qti \
    $(DEVICE_PATH)/recovery/root/sbin/android.hardware.keymaster@4.0-service-qti \
    $(DEVICE_PATH)/recovery/root/sbin/vendor.qti.hardware.vibrator@1.2-service \
    $(DEVICE_PATH)/recovery/root/sbin/predecrypt.sh \
    $(DEVICE_PATH)/recovery/root/system/lib64/libandroidicu.so

PRODUCT_PACKAGES += fastbootd
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)
