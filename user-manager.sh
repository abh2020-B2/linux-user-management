#!/bin/bash
# Shebang

# Load libraries - بارگذاری فایل ها
source  Lib/utils.sh
source  Lib/users.sh
source  Lib/groups.sh
source  Lib/backup.sh

# Check if user is root - بررسی دسترسی روت
check_root

while true
do
    clear # clean terminal
    show_banner
    echo "1) Create User"
    echo "2) Delete User"
    echo "3) Change Password"
    echo "4) Lock User"
    echo "5) Unlock User"
    echo "6) List Users"
    echo "7) Show User Info"
    echo "8) Add User to Group"
    echo "9) Remove User from Group"
    echo "10) List Groups"
    echo "11) Check Last Login"
    echo "12) Backup /etc/passwd"
    echo "13) Restore Backup"
    echo "0) Exit"
    
    echo 
    read -p "Choose an option: " choice

    case $choice in 
        1) create_user ;;
        2) delete_user ;;
        3) change_password ;;
        4) lock_user ;;
        5) unlock_user ;;
        6) list_users ;;
        7) show_user_info ;;
        8) add_to_group ;;
        9) remove_from_group ;;
        10) list_groups ;;
        11) last_login ;;
        12) backup_passwd ;;
        13) restore_passwd ;;
        0)
         echo "Goodbye!"
            exit 0
            ;;
        *)
        echo "Invalid option!"
            sleep 2
            ;;
    esac
done
