#!/bin/bash

ips=$(cat $1)
output=$HOME/aliveips.txt

if [ -f $output ]; then
  >$output
fi

for ip in ${ips[@]}; do
	fping -g $ip | grep alive | awk '{print $1}' >> $output
done
