# SpectrWM Bar script
while :; do
    BATTERY="$(upower -e | grep 'BAT')"
    BATTERY_PERCENTAGE="$(upower -i ${BATTERY} | grep -E "state|to\ full|percentage" | awk 'NR == 2 {print $2}')"
    BATTERY_STATUS="$(upower -i ${BATTERY} | grep -E "state|to\ full|percentage" | awk 'NR == 1 {print $2}')"

    if [ "${BATTERY_STATUS}" == "fully-charged" ]; then
        BATTERY_STATUS_SHORT="F"
    fi

    VOLUME="$(pactl list sinks | awk 'NR == 10 {print $5}')"

    echo "${BATTERY_STATUS_SHORT} ${BATTERY_PERCENTAGE} | ${VOLUME}"
    sleep 1
done
