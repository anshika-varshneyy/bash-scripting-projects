#!/bin/bash

function display_usage {
    echo "./backup.sh <path to your source directory> <path to your backup directory>"
}
if [ $# -eq 0 ]; then

        display_usage
fi

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

function create_backup {
    zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null


    if [ $? -eq 0 ]; then
        echo "Backup generated succesfully for ${timestamp}"
    fi
}

function perfrom_rotation {
        backup_data=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
        echo "${backup_data[@]}"

        if [ "${#backup_data[@]}" -gt 5 ]; then
             echo "Performing rotation for 5 days"

             backup_data_to_remove=("${backup_data[@]:5}")
             

             for backup in "${backup_data_to_remove[@]}";
             do 
                  rm -f ${backup}
             done
        fi

}

create_backup
perfrom_rotation