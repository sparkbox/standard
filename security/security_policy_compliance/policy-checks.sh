#!/bin/sh

function start {
  echo "*****************************************************"
  printf "* $1...\n";
}

function fail {
  DETAILS=$1
  HELP_URL=$2

  echo "❌ \033[1;31m${DETAILS}\033[0m";
  if [ "${HELP_URL}" != "" ]; then
    echo "\033[1;37m${HELP_URL}\031"
  fi
  echo ""
}

function success {
  DETAILS=$1

  echo "✅ \033[1;32m${DETAILS}\033[0m\n";
}

function warning {
  DETAILS=$1
  HELP_URL=$2

  echo "⚠️ \033[1;33m ${DETAILS}\033[0m";
  if [ "${HELP_URL}" != "" ]; then
    echo "\033[1;37m${HELP_URL}\031"
  fi
  echo ""
}

function get_volume_attribute {
  NEEDLE=$1
  HAYSTACK=$2
  echo $(echo "$HAYSTACK" | grep -e "$NEEDLE:" | cut -d : -f2 | sed 's/^ *//g')
}

function validate_time_machine {
  start "Checking Time Machine Backup Disk Encryption"

  # Replace spaces with three underscores so we can use spaces as a delimiter in an array
  TIME_MACHINE_CONFIGURATION=$(tmutil destinationinfo)
  TIME_MACHINE_VOLUMES=$(tmutil destinationinfo | grep -e "Name" | sed 's/Name.*: //' | sed -e "s/ /___/g")

  if [ "${TIME_MACHINE_CONFIGURATION}" == "tmutil: No destinations configured." ]; then
    success "Backups are not configured. Encryption not required."
  elif [ "${TIME_MACHINE_VOLUMES}" == "" ]; then
    warning "No backup disks configured with Time Machine." "https://github.com/sparkbox/standard/blob/main/security/security_policy_compliance/timemachine.md#first-time-setup"
  fi

  for VOLUME in $TIME_MACHINE_VOLUMES; do
    VOLUME_NAME=$(echo ${VOLUME} | sed -e "s/___/ /g")
    VOLUME_INFO=$(diskutil info "${VOLUME_NAME}" 2> /dev/null)
    VOLUME_TYPE=$(get_volume_attribute "Type (Bundle)" "${VOLUME_INFO}")

    case $VOLUME_TYPE in
      # APFS volumes will identify their encryption status under "FileVault"
      "apfs")
        VOLUME_ENCRYPTED=$(get_volume_attribute "FileVault" "${VOLUME_INFO}")
        ;;
      # Core Storage volumes (Journaled HFS+) will identify their encryption status under "Encrypted"
      *)
        VOLUME_ENCRYPTED=$(get_volume_attribute "Encrypted" "${VOLUME_INFO}")
        ;;
    esac

    case $VOLUME_ENCRYPTED in
      Yes)
        success "\"${VOLUME_NAME}\" is encrypted."
        ;;
      No)
        fail "\"${VOLUME_NAME}\" is not encrypted." "https://github.com/sparkbox/standard/blob/main/security/timemachine.md"
        ;;
      *)
        fail "Unable to locate \"${VOLUME_NAME}\". Please check your connection to this volume and try again."
        ;;
    esac
  done
}

function validate_full_disk_encryption {
  start "Checking for FileVault full disk encryption"
  FILEVAULT_STATUS="$(fdesetup status)"

  echo "${FILEVAULT_STATUS}" | grep 'FileVault is On' &> /dev/null
  if [ $? != 0 ]; then
    fail "${FILEVAULT_STATUS}" "https://github.com/sparkbox/standard/blob/main/security/filevault.md"
  else
    success "${FILEVAULT_STATUS}"
  fi

}

function validate_software_updates {
  start "Checking for software updates"
  UPDATE_LIST="$(sudo softwareupdate -l 2>&1)"
  UPDATE_STATUS="$(echo "${UPDATE_LIST}" | grep 'No new software available\.')"

  if [ "${UPDATE_STATUS}" == "" ]; then
    fail "${UPDATE_LIST}" "https://github.com/sparkbox/standard/blob/main/security/mac-updates.md"
  else
    success "${UPDATE_STATUS}"
  fi
}

echo "Today is $(date)"

echo "Getting sudo access..."
sudo ls &> /dev/null
echo "";

validate_time_machine
validate_full_disk_encryption
validate_software_updates
