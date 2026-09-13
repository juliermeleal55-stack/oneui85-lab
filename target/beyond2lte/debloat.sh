# Copyright (c) 2026
# SPDX-License-Identifier: GPL-3.0-or-later

# Safe device-specific debloat for Galaxy S10+ (beyond2lte)
# Keep framework, telephony, connectivity, Samsung core services,
# Camera, Gallery, Settings, SystemUI, biometrics and update dependencies.

# Factory / hardware test applications not required for normal use.
SYSTEM_DEBLOAT+="

system/app/Cameralyzer
system/app/FactoryAirCommandManager
system/app/FactoryCameraFB
system/app/HMT
system/app/WlanTest
system/etc/default-permissions/default-permissions-com.sec.factory.cameralyzer.xml
system/etc/permissions/privapp-permissions-com.samsung.android.providers.factory.xml
system/etc/permissions/privapp-permissions-com.sec.facatfunction.xml
system/priv-app/FacAtFunction
system/priv-app/FactoryTestProvider
"

# Optional user-facing Samsung services.
SYSTEM_DEBLOAT+="

system/app/LiveTranscribe
system/app/SmartReminder
system/priv-app/SmartTutor
system/hidden/SmartTutor
system/priv-app/YourPhone_P1_5
"

# Microsoft / Meta / Google optional preload packages.
SYSTEM_DEBLOAT+="

system/app/FBAppManager_NS
system/etc/default-permissions/default-permissions-meta.xml
system/etc/permissions/privapp-permissions-meta.xml
system/etc/sysconfig/meta-hiddenapi-package-allowlist.xml
system/priv-app/FBInstaller_NS
system/priv-app/FBServices
system/etc/permissions/privapp-permissions-com.microsoft.skydrive.xml
system/priv-app/OneDrive_Samsung_v3
"

# Samsung promotional / recommendation services.
SYSTEM_DEBLOAT+="

system/app/MinusOnePage
system/app/MAPSAgent
system/app/PlayAutoInstallConfig
system/priv-app/AppUpdateCenter
system/etc/permissions/privapp-permissions-com.samsung.android.app.updatecenter.xml
"

# Optional Samsung analytics / diagnostics clients.
SYSTEM_DEBLOAT+="

system/app/DsmsAPK
system/etc/permissions/privapp-permissions-com.samsung.android.dqagent.xml
system/etc/permissions/privapp-permissions-com.sec.android.diagmonagent.xml
system/etc/permissions/privapp-permissions-com.sec.android.soagent.xml
system/priv-app/DeviceQualityAgent36
system/priv-app/DiagMonAgent95
system/priv-app/SOAgent76
"

# Optional AR Emoji components.
SYSTEM_DEBLOAT+="

system/etc/default-permissions/default-permissions-com.sec.android.mimage.avatarstickers.xml
system/etc/permissions/privapp-permissions-com.samsung.android.aremojieditor.xml
system/etc/permissions/privapp-permissions-com.sec.android.mimage.avatarstickers.xml
system/etc/permissions/signature-permissions-com.sec.android.mimage.avatarstickers.xml
system/priv-app/AREmojiEditor
system/priv-app/AvatarEmojiSticker
"

# Optional Samsung Calendar / Clock applications.
SYSTEM_DEBLOAT+="

system/app/SamsungCalendar
system/app/ClockPackage
"

# Optional accessibility preload not required when these features are unused.
SYSTEM_DEBLOAT+="

system/app/VoiceAccess
system/etc/sysconfig/feature-a11y-preload-voacc.xml
"

# Optional YouTube preload from the source firmware.
PRODUCT_DEBLOAT+="

app/YouTube
"
