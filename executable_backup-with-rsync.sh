#!/usr/bin/env bash

# A simple script to make backups with rsync easy!
# This will backup the entire home dir of the current user.
# (I always forget these commands.)

function print_usage {
    cat << EOF
Usage: $0 [options]

A simple script to make backups with rsync easy!
This will backup the entire home dir of the current user.

Options:
  -h         Print this help message
  -b <path>  Run a backup to this location
  -r <path>  Run a restore from this location

EOF
}

BACKUP_TO=""
RESTORE_FROM=""

while getopts hb:r: OPT; do
    case $OPT in
        h)
            print_usage
            exit 0
            ;;
        b)
            BACKUP_TO="$OPTARG"
            ;;
        r)
            RESTORE_FROM="$OPTARG"
            ;;
        *)
            print_usage
            exit 1
            ;;
    esac
done

if [ -z "$BACKUP_TO" ] && [ -z "$RESTORE_FROM" ]; then
    echo "ERROR: Choose to backup or restore!"
    exit 1
fi
if [ ! -z "$BACKUP_TO" ] && [ ! -z "$RESTORE_FROM" ]; then
    echo "ERROR: Choose backup or restore, not both!"
    exit 1
fi

if [ ! -z "$BACKUP_TO" ]; then
    echo "Backup $HOME/ to $BACKUP_TO"
    read -e -i "Press ENTER to continue..."
    
    rsync -a -h --delete --info=progress2 --stats "$HOME/" "$BACKUP_TO"
fi

if [ ! -z "$RESTORE_FROM" ]; then
    echo "Restore from $RESTORE_FROM to $HOME/"
    read -e -i "Press ENTER to continue..."

    rsync -a -h --info=progress2 --stats "$RESTORE_FROM" "$HOME/"
fi

echo "Done."

