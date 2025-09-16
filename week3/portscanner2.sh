#!/bin/bash

network_prefix=$1
port=$2

echo "ip,port" > dns-servers.txt

for i in {1..254}; do
  host_ip="${network_prefix}.${i}"

    timeout .1 bash -c "echo >/dev/tcp/${host_ip}/${port}" 2>/dev/null
    
    if [ $? -eq 0 ]; then
	echo "${host_ip},${port}" >> dns-servers.txt
    fi
done
