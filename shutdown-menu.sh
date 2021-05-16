todo="$(echo "Shut down
Suspend
Reboot" | rofi -dmenu show)"

if [ "${todo}" == "Shut down" ]; then
    shutdown -h now
elif [ "${todo}" == "Suspend" ]; then
    systemctl suspend
elif [ "${todo}" == "Reboot" ]; then
    shutdown -r now
fi
