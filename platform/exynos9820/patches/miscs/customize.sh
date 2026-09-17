#!/usr/bin/env bash

# Conservative beyond2lte compatibility hook.
# Do not alter fstab encryption, SurfaceFlinger, Vulkan, HFR, or APEX files.
# Those changes require device-specific runtime evidence and may cause boot/display failure.

LOG_STEP_IN "- Preserving native beyond2lte graphics and storage configuration"
LOG "- No forced Vulkan or SurfaceFlinger properties"
LOG "- No fstab encryption or foreign APEX modifications"
LOG_STEP_OUT
