#!/bin/bash

network_prefix=$1
dns_server=$2

echo "dns resolution for ${network_prefix}"

for i in {1..254}; do
  host_ip="${network_prefix}.${i}"
  hostname=$(dig +short @${dns_server} -x ${host_ip})
  if [ -n "$hostname" ]; then
      echo "$host_ip -> $hostname"
  fi
done

