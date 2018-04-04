#!/bin/sh

function start { 
  echo "*****************************************************"
  printf "* $1..."; 
}

function fail {
  DETAILS=$1
  HELP_URL=$2

  echo "❌";
  echo "${DETAILS}"
  echo ""
}

function success {
  DETAILS=$1

  echo "✅";
  echo "${DETAILS}"
  echo ""
}

echo "Today is $(date)"

echo "Getting sudo access..."
sudo ls &> /dev/null
echo "";

start "Checking Time Machine Backup Disk Encryption"
BACKUP_STATUS="$(diskutil cs list | grep -e "Encryption Type" -e "Volume Name")"
echo "${BACKUP_STATUS}" | grep 'AES-XTS' &> /dev/null
if [ $? == 0 ]; then
  success "${BACKUP_STATUS}"
elif [ $? == 1 ]; then
  fail "Unable to locate backup disk"
else
  fail "${BACKUP_STATUS}" "https://github.com/sparkbox/standard/blob/master/security/timemachine.md"
fi

start "Checking for FileVault full disk encryption"
FILEVAULT_STATUS="$(fdesetup status)"

echo "${FILEVAULT_STATUS}" | grep 'FileVault is On' &> /dev/null
if ! [ $? == 0 ]; then
  fail "${FILEVAULT_STATUS}" "https://github.com/sparkbox/standard/blob/master/security/timemachine.md"
else
  success "${FILEVAULT_STATUS}"
fi

start "Checking for software updates"
UPDATE_STATUS="$(sudo softwareupdate -l 2>&1)"

echo "${UPDATE_STATUS}" | grep 'No new software available' &> /dev/null
if ! [ $? == 0 ]; then
  fail "${UPDATE_STATUS}" "https://github.com/sparkbox/standard/blob/master/security/mac-updates.md"
else
  success "${UPDATE_STATUS}"
fi
