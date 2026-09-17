#!/usr/bin/env bash

# Keep the verified device-specific beyond2lte kernel.
# Do not download or replace it with a kernel from another device.
LOG_STEP_IN "- Preserving beyond2lte kernel binaries"
LOG "- No external kernel download"
LOG "- No automatic boot.img, dtb.img or dtbo.img replacement"
LOG_STEP_OUT
