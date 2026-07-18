#!/bin/bash

add_to_group() {

    read -p "Enter username: " username
    read -p "Enter group name: " group

    if [[ -z "$username" || -z "$group" ]]; then
        echo "Username and group name cannot be empty."
        sleep 2
        return
    fi

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    if ! getent group "$group" &>/dev/null; then
        echo "Group '$group' does not exist."
        sleep 2
        return
    fi

    if usermod -aG "$group" "$username"; then
        echo "User '$username' added to group '$group'."
    else
        echo "Failed to add user to group."
    fi

    read -p "Press Enter to continue..."
}

remove_from_group() {

    read -p "Enter username: " username
    read -p "Enter group name: " group

    if [[ -z "$username" || -z "$group" ]]; then
        echo "Username and group name cannot be empty."
        sleep 2
        return
    fi

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    if ! getent group "$group" &>/dev/null; then
        echo "Group '$group' does not exist."
        sleep 2
        return
    fi

    if gpasswd -d "$username" "$group"; then
        echo "User '$username' removed from group '$group'."
    else
        echo "Failed to remove user from group."
    fi

    read -p "Press Enter to continue..."
}

list_groups() {

    echo "System Groups"
    echo "-------------"

    cut -d: -f1 /etc/group

    echo
    read -p "Press Enter to continue..."
}