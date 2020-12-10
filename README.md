# android_device_xiaomi_apollo
For building PBRP(TWRP-Based) for Xiaomi Redmi K30S Ultra

*STATUS: TESTING*

 - 对于 红米K30S Ultra 有问题的话联系我。 QQ群：https://jq.qq.com/?_wv=1027&k=L7zFfYra

The Redmi K30S Ultra series (codenamed _"apollo"_) are high-end smartphones from Xiaomi.

Redmi K30S Ultra series was announced and released in November 2020.


## Device specifications

| Device       | Xiaomi Redmi K30S Ultra                     |
| -----------: | :------------------------------------------ |
| SoC          | Qualcomm SM8250 Snapdragon 865              |
| CPU          | 8x Qualcomm® Kryo™ 585 up to 2.84GHz        |
| GPU          | Adreno 630                                  |
| Memory       | 8GB (LPDDR5)                                |
| Shipped Android version | 10                               |
| Storage      | 128GB / 256GB UFS 3.1 flash storage         |
| Battery      | Non-removable Li-Po 5000mAh                 |
| Dimensions   | 165.1 x 76.4 x 9.3 mm                       |
| Display      | 2400 x 1080 (20:9), 6.67 inch               |

## Features

**Works**

- Booting
- Data decryption
- Vibration
- ADB

**Not Working**

- Adb side load


## Compile

First checkout minimal twrp with omnirom tree:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
repo sync
```

Then add these projects to .repo/manifest.xml:

```xml
<project path="device/xiaomi/apollo" name="Coralfall/android_device_xiaomi_apollo" remote="github" revision="PBRP-3.0" />
```

Finally execute these:

```
. build/envsetup.sh
lunch omni_apollo-eng
export ALLOW_MISSING_DEPENDENCIES=true # Only if you use minimal twrp tree.
mka recoveryimage 
```

To test it:

```
fastboot boot out/target/product/apollo/recovery.img
```

## Thanks
- [mauronofrio](https://github.com/mauronofrio)
- [Whyle](https://github.com/Whyle)
