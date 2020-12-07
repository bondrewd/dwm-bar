#!/bin/sh

# A dwm_bar function that shows the current time
# Diego Ugarte <diego.ugarte@outlook.com>
# GNU GPLv3

# Time is formatted like like this: "[hh:mm:ss]"
dwm_time () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf " %s" "$(date "+%T")"
    else
        printf "TIME %s" "$(date "+%T")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_time
