#!/bin/sh

# A dwm_bar function to display cpu temperature
# Diego Ugarte <diego.ugarte@outlook.com>
# GNU GPLv3

dwm_temperature () {
    # Percentage of memory used
    TEMPERATURE="$(sensors | awk '/^Core /{++r; gsub(/[^[:digit:]]+/, "", $3); s+=$3} END{printf "%.0f\n", s/(10*r)}')"
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ $TEMPERATURE -ge 0 ] && [ $TEMPERATURE -lt 25 ]; then
            printf " %s°C" "$TEMPERATURE"
        elif [ $TEMPERATURE -ge 25 ] && [ $TEMPERATURE -lt 50 ]; then
            printf " %s°C" "$TEMPERATURE"
        elif [ $TEMPERATURE -ge 50 ] && [ $TEMPERATURE -lt 75 ]; then
            printf " %s°C" "$TEMPERATURE"
        elif [ $TEMPERATURE -ge 75 ]; then
            printf " %s°C" "$TEMPERATURE"
        fi
    else
        printf "T %s°C" "$TEMPERATURE"
    fi
    printf "%s\n" "$SEP2"
}

dwm_temperature
