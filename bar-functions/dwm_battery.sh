#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Unknown" ]; then
            printf " %s%%" "$CHARGE"
        else
            if [ "$CHARGE" -ge 0 ] && [ "$CHARGE" -lt 25 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 25 ] && [ "$CHARGE" -lt 50 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 50 ] && [ "$CHARGE" -lt 75 ]; then
                printf " %s%%" "$CHARGE"
            elif [ "$CHARGE" -gt 75 ]; then
                printf " %s%%" "$CHARGE"
            fi
        fi
    else
        if [ "$STATUS" = "Charging" ]; then
            printf "BAT %s%% C" "$CHARGE"
        else
            printf "BAT %s%% U" "$CHARGE"
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery 
