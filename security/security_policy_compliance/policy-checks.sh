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

function get_volume_attribute {
  NEEDLE=$1
  HAYSTACK=$2
  echo $(echo "$HAYSTACK" | grep -e "$NEEDLE:" | sed "s/$NEEDLE: *//" | sed 's/^ *//g')
}

echo "Today is $(date)"

echo "Getting sudo access..."
sudo ls &> /dev/null
echo "";

start "Checking Time Machine Backup Disk Encryption"
# Replace spaces with three underscores so we can use spaces as a delimiter in an array
TIME_MACHINE_VOLUMES=$(tmutil destinationinfo | grep -e "Name" | sed 's/Name.*: //' | sed -e "s/ /___/g")

for VOLUME in $TIME_MACHINE_VOLUMES; do
  VOLUME_NAME=$(echo $VOLUME | sed -e "s/___/ /g")
  VOLUME_INFO=$(diskutil info "$VOLUME_NAME")
  VOLUME_TYPE=$(get_volume_attribute "Type (Bundle)" "$VOLUME_INFO")

  case $VOLUME_TYPE in
    # APFS volumes will identify their encryption status under "FileValt"
    "apfs")
      VOLUME_ENCRYPTED=$(get_volume_attribute "FileVault" "$VOLUME_INFO")
      ;;
    # Core Storage volumes (Journaled HFS+) will identify their encryption status under "Encrypted"
    *)
      VOLUME_ENCRYPTED=$(get_volume_attribute "Encrypted" "$VOLUME_INFO")
      ;;
  esac

  case $VOLUME_ENCRYPTED in
    Yes)
      success "$VOLUME_NAME"
      ;;
    No)
      fail "$VOLUME_NAME is not encrypted (https://github.com/sparkbox/standard/blob/master/security/timemachine.md)."
      ;;
    *)
      fail "Unable to locate $VOLUME_NAME. Please check your connection to this volume and try again."
      ;;
  esac
done

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
