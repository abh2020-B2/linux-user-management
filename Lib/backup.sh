#!/bin/bash

backup_passwd() {

    if cp /etc/passwd backup/passwd.bak; then
        echo "Backup created successfully."
    else
        echo "Failed to create backup."
    fi

    read -p "Press Enter to continue..."
}

restore_passwd() {

    if [[ ! -f backup/passwd.bak ]]; then
        echo "Backup file not found."
        sleep 2
        return
    fi

    read -p "Restore backup? (y/n): " confirm

    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Operation cancelled."
        sleep 2
        return
    fi

    if cp backup/passwd.bak /etc/passwd; then
        echo "Backup restored successfully."
    else
        echo "Failed to restore backup."
    fi

    read -p "Press Enter to continue..."
}