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

# Optional Google preload components already supported by the global UN1CA debloat.
PRODUCT_DEBLOAT+="

app/YouTube
app/DuoStub
app/AssistantShell
app/BardShell
app/Gmail2
app/Maps
app/Chrome
overlay/GmsConfigOverlaySearchSelector.apk
priv-app/SearchSelector
"

# S10+ has no S Pen hardware; remove S Pen-specific user applications only.
SYSTEM_DEBLOAT+="

system/priv-app/AirCommand
system/priv-app/AirReadingGlass
system/priv-app/SmartEye
"

# Additional optional user applications/services.
# These are not required for Android framework boot, telephony, connectivity,
# SystemUI, camera, biometrics or the core Samsung setup.
SYSTEM_DEBLOAT+="

system/app/SamsungMembers
system/app/SamsungMusic
system/app/SamsungShop
system/app/SamsungInternet
system/app/SmartSwitch
system/priv-app/SmartSwitchAssistant
system/priv-app/SamsungMembers
system/priv-app/SamsungMusic
"

# Optional Samsung customization/theme components.
# Removing these only drops theme-store functionality; it does not remove
# SystemUI or the underlying framework.
SYSTEM_DEBLOAT+="

system/app/ThemeCenter
system/priv-app/ThemeStore
system/priv-app/ThemeCenter
"

# Additional non-boot user applications.
# These are convenience applications and are not required for the Android
# framework, SystemUI, telephony, connectivity, camera or biometric stack.
SYSTEM_DEBLOAT+="

system/app/SamsungHealth
system/app/SamsungNotes
system/app/SamsungCalculator
system/app/SamsungVoiceRecorder
system/app/SamsungWeather
system/app/GalaxyStore
system/priv-app/SamsungHealth
system/priv-app/SamsungNotes
"
