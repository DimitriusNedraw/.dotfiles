#!/bin/bash
# Get config path from rclone
config=$(rclone config file)
# Remove everything except the path
RCLONE_CONFIG="/${config#*/}"
export RCLONE_CONFIG

# Exit if rclone running
if [[ "$(pidof -x $(basename $0) -o %PPID)" ]]; then exit; fi


syncFolders=("Documents" "Pictures" "Photos" ".ssh" ".kube" ".gnupg" ".ca" ".syncthing")



for folder in "${syncFolders[@]}"
do
   echo "INFO: Backuping '$folder'"
   /usr/bin/rclone sync "$folder" "GoogleDriveCrypt:$folder" \
    --verbose
done
