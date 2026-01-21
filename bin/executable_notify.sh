#!/bin/sh

# Cross-platform notification script for macOS and Linux (Gnome)
# Usage: notify.sh "Title" "Message"

if [ $# -ge 2 ]; then
    TITLE="$1"
    MESSAGE="$2"
else
    TITLE="Notification"
    MESSAGE="${1:-Notification}"
fi

case "$(uname -s)" in
    Darwin)
        osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\" sound name \"Glass\""
        ;;
    Linux)
        notify-send "$TITLE" "$MESSAGE"
        if command -v paplay >/dev/null 2>&1; then
            paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null ||
            paplay /usr/share/sounds/gnome/default/alerts/glass.ogg 2>/dev/null
        elif command -v aplay >/dev/null 2>&1; then
            aplay /usr/share/sounds/sound-icons/glass-water-1.wav 2>/dev/null
        fi
        ;;
    *)
        echo "Unsupported platform: $(uname -s)" >&2
        exit 1
        ;;
esac
