#!/bin/sh

# update first
sudo apt update;
printf "\n*****************************************************\n";

# view upgrades if any
echo "Display list of upgrades available:"
apt list --upgradable;
printf "\n*****************************************************\n"

# view disks on the system, specifically check for cryptdata
# which indicates encryption or not
# TODO verify it's the root drive that is encrypted
_=$(lsblk -f | grep data-root -B 1 | grep cryptdata);
device_code=$?;
lsblk -f;
if [ "${device_code}" -eq 0 ]; then
    printf "\n✅ Drive is encrypted.";
else
    printf "\n❌ Drive is not encrypted.";
fi
printf "\n*****************************************************\n"

echo "Today is $(date)";
