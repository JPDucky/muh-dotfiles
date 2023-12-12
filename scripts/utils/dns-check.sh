#!/bin/bash

# find fastest DNS server
DNS_SERVERS=("1.1.1.1" "8.8.8.8" "9.9.9.9" "4.2.2.1")

# choose best connection
conn_best=$(parallel "ping -c 5 {} | tail -1" ::: "${DNS_SERVERS[@]}" | \
    awk -F '/' '
    /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/ { ip=$0; next }
    /^rtt/ { split($5, a, " "); print ip " " a[1] }
    ' | sort -nk2 | head -n 1)

echo "$conn_best"
