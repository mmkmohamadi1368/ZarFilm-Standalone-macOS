#!/bin/bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP="$ROOT/build/ZarFilm.app"

rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS"

swiftc -O -target x86_64-apple-macosx12.0 \
  -framework Cocoa \
  -framework WebKit \
  "$ROOT/Sources/ZarFilmStandalone.swift" \
  -o "$APP/Contents/MacOS/ZarFilm"

cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDisplayName</key>
    <string>ZarFilm</string>
    <key>CFBundleExecutable</key>
    <string>ZarFilm</string>
    <key>CFBundleIdentifier</key>
    <string>com.zarfilm.standalone</string>
    <key>CFBundleName</key>
    <string>ZarFilm</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>LSMinimumSystemVersion</key>
    <string>12.0</string>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
PLIST

codesign --force --deep --sign - "$APP"

echo "Build completed successfully."
echo "$APP"
