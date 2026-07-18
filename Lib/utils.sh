#!/bin/bash

check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run this script as root."
        exit 1
    fi
}

show_banner() {
    echo "======================================"
    echo " Linux User Management Toolkit"
    echo "======================================"
    echo
}