#!/bin/bash

network_prefix=$1
dns_server=$2

echo "dns resolution for ${network_prefix}.0/24"

for i in {1..254}; do
    host_ip="${network_prefix}.${i}"
    hostname=$(nslookup ${host_ip} ${dns_server} 2>/dev/null | grep "name =" | cut -d"=" -f2 | tr -d ' ' )
    if [ -n "$hostname" ]; then
	echo "$host_ip name = $hostname"
    fi
done
