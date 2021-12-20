#!/bin/sh

isNix() {
  [ -f "/etc/nixos/configuration.nix" ]
}

checkGitSigning() {
  temp=$(mktemp -d)
  cd "${temp}"
  git init -q
  git commit -q --allow-empty -m "verify gpg signing"
  status=$(git log -1 --pretty='format:%G?')
  if [ "${status}" = "G" ]; then
      printf "\n✅ GPG Signing set up correctly...\n";
  else
      printf "\n❌ GPG Signing not set up correctly...\n";
  fi
}

nixCheck() {
    # check if we're up to date with the channel (stable assumed)
    printf "Check if we're up to date with stable channel..."
    stable=$(curl -s "https://monitoring.nixos.org/prometheus/api/v1/query?query=channel_revision" | jq -r '.data.result[] | .metric | select(.channel == "nixos-21.11") | .revision')
    installed=$(nixos-version --hash)

    if [ "${stable}" = "${installed}" ]; then
      printf "\n✅ Up to date\n";
    else
      printf "\n❌ Not up to date!\n";
    fi

    printf "Check if the root zfs device is encrypted (note this assumes a single drive)..."
    zfsEncrypted=$(zfs get encryption -H -d 0 -t filesystem | cut -f 3)

    if [ "${zfsEncrypted}" != "off" ]; then
      printf "\n✅ Drive is encrypted.\n";
    else
      printf "\n❌ Drive is not encrypted.\n";
    fi

    printf "Checking git gpg signing status..."
    checkGitSigning
}

popCheck() {
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
}

if isNix; then
    printf "Detected NixOS, proceeding with NixOS-specific checks...\n"
    nixCheck
else
    printf "Proceeding with PopOS-specific checks...\n"
    popCheck
fi


echo "Today is $(date)";
