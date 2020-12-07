#!/bin/sh

# A dwm_bar function to display disk usage
# Diego Ugarte <diego.ugarte@outlook.com>
# GNU GPLv3

dwm_disk () {
    DISK="nvme0n1p3"
    # Percentage of memory used
    MEM=$(df | grep $DISK | awk '{print $3/$2*100}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf " %0.2f%%" "$MEM"
    else
        printf "DSK %0.2f%%" "$MEM"
    fi
    printf "%s\n" "$SEP2"
}

dwm_disk
