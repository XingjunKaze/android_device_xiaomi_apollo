# android_device_xiaomi_apollo

TWRP device tree for Xiaomi Mi 10T / 10T Pro / Redmi K30S Ultra

*STATUS: BETA*

The Xiaomi Mi 10T serie (codenamed: "apollo") are high-end smartphones from Xiaomi and was announced and released in October 2020.

## Device specifications

| Device       | Xiaomi Mi 10T / 10T Pro / Redmi K30S Ultra  |
| -----------: | :------------------------------------------ |
| SoC          | Qualcomm SM8250 Snapdragon 865              |
| CPU          | 8x Qualcomm® Kryo™ 585 up to 2.84GHz        |
| GPU          | Adreno 650                                  |
| Memory       | 8GB (LPDDR5)                                |
| Shipped Android version | 10                               |
| Storage      | 128GB / 256GB UFS 3.1 flash storage         |
| Battery      | Non-removable Li-Po 5000mAh                 |
| Dimensions   | 165.1 x 76.4 x 9.3 mm                       |
| Display      | 2400 x 1080 (20:9), 6.67 inch               |

## Features

**Works**

- Booting.
- **Decryption** (Android 11)
- ADB
- MTP
- OTG
- Super partition functions

## Compile

First checkout minimal twrp with omnirom tree:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
repo sync
```

Then add these projects to .repo/manifest.xml:

```xml
<project path="device/xiaomi/apollo" name="Coralfall/android_device_xiaomi_apollo" remote="github" revision="android-11" />
```

Finally execute these:

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_umi-eng
mka recoveryimage
```

To test it:

```
fastboot boot out/target/product/apollo/recovery.img
```

## Thanks
- [FsCrypt fix by mauronofrio](https://github.com/mauronofrio/android_bootable_recovery)
- [Decryption by bigbiff](https://github.com/bigbiff/android_bootable_recovery)
- [Oneplus 8 TWRP by mauronofrio](https://github.com/mauronofrio/android_device_oneplus_instantnoodle_TWRP)
