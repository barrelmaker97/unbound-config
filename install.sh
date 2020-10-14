#!/bin/bash

# Color codes for output
RED='\e[1;31m'
GREEN='\e[1;32m'
RESET='\e[0m'

TICK="\\r [${GREEN}✓${RESET}]"
CROSS="\\r [${RED}✗${RESET}]"
INFO="\\r [i]"

echo -ne "${INFO} Checking for unbound"
command -v unbound > /dev/null
if [ $? -eq 1 ]; then
	echo -e "${CROSS} Unbound is not installed or cannot be found on this system"
	exit 1
fi
echo -e "${TICK}"
sudo mkdir -p /etc/unbound/unbound.conf.d
sudo ln -f ./*.conf /etc/unbound/unbound.conf.d
