#!/usr/bin/env bash

# Exynos9820 safety mode:
# preserve native beyond2lte camera libraries, HALs and models.
# Foreign p3sxxx/a26xxx camera blobs are intentionally not imported.

LOG_STEP_IN "- Preserving native beyond2lte camera stack"
LOG "- No foreign camera blobs or HAL removals applied"
LOG_STEP_OUT
