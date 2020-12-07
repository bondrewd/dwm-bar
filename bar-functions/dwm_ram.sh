#!/bin/sh

# A dwm_bar function to display ram usage
# Diego Ugarte <diego.ugarte@outlook.com>
# GNU GPLv3

dwm_ram () {
    # Percentage of memory used
    MEM=$(free | awk '(NR == 2) {print $3/$2*100}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "﬙ %0.2f%%" "$MEM"
    else
        printf "MEM %0.2f%%" "$MEM"
    fi
    printf "%s\n" "$SEP2"
}

dwm_ram
