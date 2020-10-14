#!/bin/bash
set -e

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

echo -ne " ${INFO} Checking for root hints file"
if ! [ -f /var/lib/unbound/root.hints ]; then
	echo -e "${TICK}"
	echo -ne " ${INFO} Downloading root hints file"
	sudo curl -s -o /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache
fi
echo -e "${TICK}"

echo -ne " ${INFO} Validating configuration"
find . -name "*.conf" -print0 | xargs -0 -n1 unbound-checkconf  -f > /dev/null
echo -e "${TICK}"

echo -ne " ${INFO} Creating config directory"
sudo mkdir -p /etc/unbound/unbound.conf.d
echo -e "${TICK}"

echo -ne " ${INFO} Linking config files"
sudo ln -f ./*.conf /etc/unbound/unbound.conf.d
echo -e "${TICK}"
