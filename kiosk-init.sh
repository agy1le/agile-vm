#!/bin/bash
mkdir -p /config/.config/autostart
cat > /config/.config/autostart/firefox-kiosk.desktop << EOF
[Desktop Entry]
Type=Application
Name=Firefox Kiosk
Exec=firefox --kiosk https://www.google.com
Hidden=false
X-GNOME-Autostart-enabled=true
EOF
