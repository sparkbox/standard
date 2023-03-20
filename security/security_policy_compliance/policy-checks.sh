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
    echo "\n\033[1;37m${HELP_URL}\031"
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

function get_major_version {
  echo $@ | awk -F '.' '{print $1}'
}

function get_minor_patch_versions {
  echo $@ | awk -F '.' '{print $2 "." $3}'
}

function validate_software_updates {
  start "Checking for software updates"
  UPDATE_LIST="$(sudo softwareupdate -l 2>&1)"
  SUCCESS_STATUS="$(echo "${UPDATE_LIST}" | grep 'No new software available\.')"

  if [ "${SUCCESS_STATUS}" != "" ]; then
    success "${SUCCESS_STATUS}"
    return
  fi

  # The string to search for macOS updates
  OS="Title: macOS"

  # find all updates that are not OS updates
  REQUIRED_SOFTWARE_UPDATES="$(echo "${UPDATE_LIST}" | grep "Title: " | grep --invert-match "$OS")"

  # get the user's current MacOS version
  MACHINE_MAC_OS_VERSION="$(sw_vers -productVersion)"

  # find available minor / patch version updates
  # updates within the same major version of the user
  # indicate that a minor or patch update is available
  # security updates are typically patches
  MAC_OS_UPDATE_MINOR_VERSION="$(echo "${UPDATE_LIST}" | grep "$OS" \
    | grep "Version: $(get_major_version $MACHINE_MAC_OS_VERSION)" \
    | awk -F ', ' '{print $2}' | awk -F ': ' '{print $2}')"

  # find available major version upgrades
  # updates that are NOT within the user's current major version
  # indicate that a major version upgrade is available
  MAC_OS_UPDATE_MAJOR_VERSION=$(echo "${UPDATE_LIST}" | grep "$OS" \
    | grep --invert-match "Version: $(get_major_version $MACHINE_MAC_OS_VERSION)")

  # major OS version upgrades are not strictly required
  # due to differing needs and preferences
  # people may be unable to upgrade due to project dependencies
  # or may prefer to wait out the initial release bugs
  if [ "$MAC_OS_UPDATE_MAJOR_VERSION" != '' ]; then
    echo "⭐️ A newer Mac OS version is available. This upgrade is not required, but recommended:"
    echo "$MAC_OS_UPDATE_MAJOR_VERSION"
    echo ""
  fi

  if [ "$REQUIRED_SOFTWARE_UPDATES" = '' ] && [ "$MAC_OS_UPDATE_MINOR_VERSION" = '' ]; then
    success "No security updates required!"
    return;
  fi

  # because security updates are typically patches, they're required
  # this currently requires minor version updates as well, but that may be overkill
  if [ "$MAC_OS_UPDATE_MINOR_VERSION" != $MACHINE_MAC_OS_VERSION ]; then
    fail "A MacOS update is required:\n\n\tCurrent machine OS version:\t$MACHINE_MAC_OS_VERSION\n\tNeeds updated to version:\t$MAC_OS_UPDATE_MINOR_VERSION" "https://github.com/sparkbox/standard/blob/main/security/mac-updates.md"
  fi

   if [ "$REQUIRED_SOFTWARE_UPDATES" != '' ]; then
    fail "Software updates required:\n\n${REQUIRED_SOFTWARE_UPDATES}" "https://github.com/sparkbox/standard/blob/main/security/mac-updates.md"
   fi
}

echo "Today is $(date)"

echo "Getting sudo access..."
sudo ls &> /dev/null
echo "";

validate_time_machine
validate_full_disk_encryption
validate_software_updates
