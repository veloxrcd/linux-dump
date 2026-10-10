#!/usr/bin/env bash

choice=$(printf 'Lock\nLogout\nSuspend\nReboot\nShutdown' | rofi -dmenu -i -p "power" \
  -theme-str '
    window { width: 300px; }
    listview { lines: 5; }
  ')

case "$choice" in
  Lock)     loginctl lock-session ;;
  Logout)   swaymsg exit ;;
  Suspend)  loginctl suspend ;;
  Reboot)   loginctl reboot ;;
  Shutdown) loginctl poweroff ;;
esac
