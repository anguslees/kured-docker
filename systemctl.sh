#!/bin/sh
# Only implements "reboot"

case "$1" in
    reboot)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.Reboot boolean:false
        ;;
    *)
        echo "Unimplemented subcommand '$1'" >&2
        exit 1
        ;;
esac

exit 0
