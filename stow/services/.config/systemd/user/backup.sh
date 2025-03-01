#!/bin/bash
# Get config path from rclone
config=$(rclone config file)
# Remove everything except the path
RCLONE_CONFIG="/${config#*/}"
export RCLONE_CONFIG

# Exit if rclone running
if [[ "$(pidof -x $(basename $0) -o %PPID)" ]]; then exit; fi


syncFolders=("Документы" "Изображения" "Музыка" "Рабочий стол" "Фотографии" ".ssh" ".kube" ".gnupg")



for folder in "${syncFolders[@]}"
do
   /usr/bin/rclone sync "~/$folder" "GoogleDriveCrypt:$folder" \
    --log-file ~/.logs/rclone_upload.log \
    --verbose
done
