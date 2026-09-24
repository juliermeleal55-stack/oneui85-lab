#!/usr/bin/env bash
# Validate the static contract required to start a build for a target.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REQUESTED_TARGET="${1:?Usage: check_target_contract.sh <target>}"

FAILURES=0

FAIL()
{
    echo "! $*" >&2
    FAILURES=$((FAILURES + 1))
}

TARGET_DIR="$SRC_DIR/target/$REQUESTED_TARGET"
[ -f "$TARGET_DIR/config.sh" ] || { FAIL "Missing target configuration: target/$REQUESTED_TARGET/config.sh"; exit 1; }

# shellcheck disable=SC1090
source "$TARGET_DIR/config.sh"

for VARIABLE in TARGET_NAME TARGET_CODENAME TARGET_PLATFORM TARGET_FIRMWARE \
    TARGET_API_LEVEL TARGET_PRODUCT_FIRST_API_LEVEL TARGET_VNDK_VERSION \
    TARGET_SINGLE_SYSTEM_IMAGE TARGET_OS_FILE_SYSTEM TARGET_BOOT_DEVICE_PATH; do
    [ -n "${!VARIABLE:-}" ] || FAIL "Target configuration does not set $VARIABLE"
done

[ "$REQUESTED_TARGET" = "${TARGET_CODENAME:-}" ] || FAIL "Target codename does not match its directory"
[ -d "$SRC_DIR/platform/${TARGET_PLATFORM:-}" ] || FAIL "Missing platform directory: platform/${TARGET_PLATFORM:-unset}"
[ -f "$SRC_DIR/platform/${TARGET_PLATFORM:-}/config.sh" ] || FAIL "Missing platform configuration: platform/${TARGET_PLATFORM:-unset}"
[ "${#TARGET_ASSERT_MODEL[@]}" -gt 0 ] || FAIL "TARGET_ASSERT_MODEL must contain at least one model"

case "${TARGET_OS_FILE_SYSTEM:-}" in
    erofs|ext4) ;;
    *) FAIL "Unsupported TARGET_OS_FILE_SYSTEM: ${TARGET_OS_FILE_SYSTEM:-unset}" ;;
esac

case "${TARGET_SINGLE_SYSTEM_IMAGE:-}" in
    essi|essi_64) ;;
    *) FAIL "Unsupported TARGET_SINGLE_SYSTEM_IMAGE: ${TARGET_SINGLE_SYSTEM_IMAGE:-unset}" ;;
esac

if [ "${TARGET_SUPER_PARTITION_SIZE:-0}" = "0" ] && [ ! -f "$TARGET_DIR/postinstall.edify" ]; then
    FAIL "Legacy-partition target requires target/$REQUESTED_TARGET/postinstall.edify"
fi

echo "target_contract_target=$REQUESTED_TARGET"
echo "target_contract_platform=${TARGET_PLATFORM:-unset}"
echo "target_contract_failures=$FAILURES"
[ "$FAILURES" -eq 0 ]
