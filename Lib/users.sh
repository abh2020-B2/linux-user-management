#!/bin/bash

create_user() {

    read -p "Enter username: " username

    # Check empty input -z --> zero
    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    # Check if user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        sleep 2
        return
    fi

    # Create user
    if useradd -m "$username"; then
        echo "User '$username' created successfully."
    else
        echo "Failed to create user."
    fi

    read -p "Press Enter to continue..."
}

delete_user() {

    read -p "Enter username: " username

    # Check empty input
    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    # Check if user exists
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    read -p "Delete user '$username'? (y/n): " confirm

    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Operation cancelled."
        sleep 2
        return
    fi

    if userdel -r "$username"; then
        echo "User '$username' deleted successfully."
    else
        echo "Failed to delete user."
    fi

    read -p "Press Enter to continue..."
}

change_password() {

    read -p "Enter username: " username

    # Check empty input
    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    # Check if user exists
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    passwd "$username"

    if [[ $? -eq 0 ]]; then
        echo "Password changed successfully."
    else
        echo "Failed to change password."
    fi

    read -p "Press Enter to continue..."
}

lock_user() {

    read -p "Enter username: " username

    # Check empty input
    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    # Check user exists
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    if passwd -l "$username"; then
        echo "User '$username' has been locked."
    else
        echo "Failed to lock user."
    fi

    read -p "Press Enter to continue..."
}

unlock_user() {

    read -p "Enter username: " username

    # Check empty input
    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    # Check user exists
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    if passwd -u "$username"; then
        echo "User '$username' has been unlocked."
    else
        echo "Failed to unlock user."
    fi

    read -p "Press Enter to continue..."
}

list_users() {

    echo "System Users"
    echo "------------"

    awk -F: '$3 >= 1000 {print $1}' /etc/passwd

    echo
    read -p "Press Enter to continue..."
}

show_user_info() {

    read -p "Enter username: " username

    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    id "$username"

    echo
    read -p "Press Enter to continue..."
}

last_login() {

    read -p "Enter username: " username

    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        sleep 2
        return
    fi

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        sleep 2
        return
    fi

    lastlog -u "$username"

    echo
    read -p "Press Enter to continue..."
}