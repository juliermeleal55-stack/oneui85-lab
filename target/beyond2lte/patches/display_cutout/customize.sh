# The lock-screen punch-hole floating feature is cosmetic. Status-bar layout is
# driven by DisplayCutout/WindowInsets, whose source is framework-res.apk.
# The coordinates below are the measured SM-G975F outer cutout bounds in
# display coordinate space: left=164.5, top=1, right=195.5, bottom=32.
# The measured inner bounds are left=166.8, top=3.3, right=193.2, bottom=29.7;
# they are intentionally not used for WindowInsets because Android requires
# the outer bounding rectangle when computing the safe status-bar inset.
# Android cutout paths are centered horizontally, hence x = +/-15.5.

FRAMEWORK_APK="system/framework/framework-res.apk"
SYSTEMUI_APK="system_ext/priv-app/SystemUI/SystemUI.apk"
CUTOUT_PATH="M -15.5,1 H 15.5 V 32 H -15.5 Z"

DECODE_APK "system" "$FRAMEWORK_APK"
DECODE_APK "system_ext" "priv-app/SystemUI/SystemUI.apk"

FRAMEWORK_RES="$APKTOOL_DIR/$FRAMEWORK_APK/res"
SYSTEMUI_RES="$APKTOOL_DIR/$SYSTEMUI_APK/res"

# Fail closed if the Android 16 source layout changes: silently patching a
# non-existent resource would leave the final image with the wrong insets.
for RESOURCE in \
    config_mainBuiltInDisplayCutout \
    config_mainBuiltInDisplayCutoutForUDC \
    config_mainBuiltInDisplayCutoutRectApproximation; do
    grep -R -q "name=\\\"$RESOURCE\\\"" "$FRAMEWORK_RES" || { LOGE "framework-res.apk is missing $RESOURCE"; exit 1; }
done
for RESOURCE in \
    status_bar_height \
    status_bar_padding_top \
    status_bar_basic_top_margin_without_cutout; do
    grep -R -q "name=\\\"$RESOURCE\\\"" "$SYSTEMUI_RES" || { LOGE "SystemUI.apk is missing $RESOURCE"; exit 1; }
done

# Keep SystemUI's own dimensions intact: they describe icon/text layout. The
# downward offset originates from WindowInsets receiving the source-device
# DisplayCutout. Replace only the measured geometry consumed by WindowInsets.
python3 - "$FRAMEWORK_RES" "$CUTOUT_PATH" <<'PY'
import pathlib
import sys
import xml.etree.ElementTree as ET

resources_dir = pathlib.Path(sys.argv[1])
path = sys.argv[2]
values = {
    "config_mainBuiltInDisplayCutout": path,
    "config_mainBuiltInDisplayCutoutForUDC": "",
    "config_mainBuiltInDisplayCutoutRectApproximation": path,
}
changed = set()
for xml_file in resources_dir.rglob("*.xml"):
    try:
        tree = ET.parse(xml_file)
    except ET.ParseError:
        continue
    dirty = False
    for element in tree.getroot().iter():
        name = element.attrib.get("name")
        if name in values:
            element.text = values[name]
            changed.add(name)
            dirty = True
    if dirty:
        tree.write(xml_file, encoding="utf-8", xml_declaration=True)
missing = sorted(set(values) - changed)
if missing:
    raise SystemExit("unmodified framework resources: " + ", ".join(missing))
PY
