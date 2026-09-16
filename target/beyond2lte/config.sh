#
# Galaxy S10+ (Exynos) target configuration
#
# This target is intentionally independent from target/d2s. Do not reuse
# d2s device-specific patches, overlays, VINTF fragments or postinstall logic
# until they have been validated against beyond2lte.
#

TARGET_NAME="Galaxy S10+ (Exynos)"
TARGET_CODENAME="beyond2lte"
TARGET_ASSERT_MODEL=("SM-G975F")
TARGET_PLATFORM="exynos9820"

# S10+ stock firmware line. The third field is an IMEI/TAC used by samloader;
# replace it with a valid TAC/IMEI only in a local build environment if FUS
# requires it. It is not stored as a personal device identifier here.
TARGET_FIRMWARE="SM-G975F/ZTO/35035054"
TARGET_EXTRA_FIRMWARES=("")

# Target vendor baseline: Android 12 / API 31 on the final stock firmware.
TARGET_API_LEVEL=31
TARGET_PRODUCT_FIRST_API_LEVEL=28
TARGET_VNDK_VERSION=31

# The S10+ port uses the ESSI pipeline, but its partition/repartition contract
# must be handled separately from the Note10+ d2s target.
TARGET_SINGLE_SYSTEM_IMAGE="essi"
TARGET_OS_FILE_SYSTEM="ext4"
TARGET_SUPER_PARTITION_SIZE=0
TARGET_SUPER_GROUP_NAME="none"
TARGET_SUPER_GROUP_SIZE=0
TARGET_HAS_SYSTEM_EXT=false
TARGET_BOOT_DEVICE_PATH="/dev/block/by-name"

# SEC Product Feature
TARGET_AUDIO_SUPPORT_ACH_RINGTONE=false
TARGET_AUDIO_SUPPORT_VIRTUAL_VIBRATION=true
TARGET_AUTO_BRIGHTNESS_TYPE="4"
TARGET_DISPLAY_CUTOUT_TYPE="center"
TARGET_DVFS_CONFIG_NAME="dvfs_policy_default"
TARGET_FP_SENSOR_CONFIG="google_touch_display_ultrasonic"
TARGET_HAS_HW_MDNIE=true
TARGET_HAS_MASS_CAMERA_APP=false
TARGET_HAS_QHD_DISPLAY=true
TARGET_HFR_DEFAULT_REFRESH_RATE="60"
TARGET_HFR_MODE="0"
TARGET_HFR_SEAMLESS_BRT="none"
TARGET_HFR_SEAMLESS_LUX="none"
TARGET_HFR_SUPPORTED_REFRESH_RATE="60"
TARGET_IS_ESIM_SUPPORTED=false
TARGET_MDNIE_SUPPORTED_MODES="65303"
TARGET_MDNIE_WEAKNESS_SOLUTION_FUNCTION="3"
TARGET_NFC_CHIP_VENDOR="SLSI"
TARGET_SUPPORT_HOTSPOT_6GHZ=false
TARGET_SUPPORT_HOTSPOT_DUALAP=false
TARGET_SUPPORT_HOTSPOT_ENHANCED_OPEN=false
TARGET_SUPPORT_HOTSPOT_WIFI_6=true
TARGET_SUPPORT_HOTSPOT_WPA3=false
TARGET_SUPPORT_WIFI_7=false
