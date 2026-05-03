#!/bin/bash
mkdir -p /config/.config/autostart
cat > /config/.config/autostart/firefox-kiosk.desktop << EOF
[Desktop Entry]
Type=Application
Name=Firefox Kiosk
Exec=firefox --kiosk https://www.google.com
Hidden=false
X-GNOME-Autostart-enabled=true
X-GNOME-Autostart-Delay=3
EOF
chmod 644 /config/.config/autostart/firefox-kiosk.desktop
chown -R abc:abc /config/.config/autostart
