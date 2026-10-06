#!/bin/bash

# Check root privilege
check_root(){
    if [[ "$EUID" -ne 0 ]]; then
        echo "Error: This script must be run as root user." >&2
        exit 1
    fi
}

# Create user
create_user(){
    read -p "Enter username to create: " username
    username=$(echo "$username" | xargs)

    if [[ -z "$username" ]]; then
        echo "Username cannot be empty."
        return
    fi

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        return
    fi

    read -s -p "Enter password for '$username': " password
    echo
    read -s -p "Confirm password for '$username': " password_confirm
    echo

    if [[ "$password" != "$password_confirm" ]]; then
        echo "Error: Passwords do not match."
        return
    fi

    useradd -m -s /bin/bash "$username"
    echo "$username:$password" | chpasswd
    echo "User '$username' created successfully."

    read -p "Add user to a group? (y/n): " add_group
    if [[ "$add_group" =~ ^[Yy]$ ]]; then
        read -p "Enter group name: " groupname
        groupname=$(echo "$groupname" | xargs)

        if grep -q "^$groupname:" /etc/group; then
            usermod -aG "$groupname" "$username"
            echo "User '$username' added to group '$groupname'."
        else
            read -p "Group '$groupname' does not exist. Create new group? (y/n): " create_group
            if [[ "$create_group" =~ ^[Yy]$ ]]; then
                groupadd "$groupname"
                usermod -aG "$groupname" "$username"  # Fixed missing '$'
                echo "Group '$groupname' created and user '$username' added to it."
            else
                echo "Skipping group creation."
            fi
        fi
    fi 
}

# Delete user
delete_user(){
    read -p "Enter username to delete: " username
    username=$(echo "$username" | xargs)

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        return 
    fi

    read -p "Are you sure you want to delete user '$username'? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        userdel -r "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User deletion aborted."
    fi
}

# List all users
list_users(){
    echo "Listing all system users:"
    awk -F ":" '{print $1}' /etc/passwd
}

# Lock user
lock_user(){
    read -p "Enter username to lock: " username
    username=$(echo "$username" | xargs)

    if id "$username" &>/dev/null; then
        passwd -l "$username"
        echo "User '$username' has been locked."
    else
        echo "User '$username' does not exist."
    fi
}

# Unlock user
unlock_user(){
    read -p "Enter username to unlock: " username
    username=$(echo "$username" | xargs)
    
    if id "$username" &>/dev/null; then
        passwd -u "$username"
        chage -E -1 "$username"
        usermod -s /bin/bash "$username"
        echo "User '$username' has been unlocked."
    else
        echo "User '$username' does not exist."
    fi
}

show_menu(){
    echo "__________________________"
    echo " User Management Script"
    echo "__________________________"
    echo "1- Create a new user"
    echo "2- Delete a user"
    echo "3- List all users"
    echo "4- Lock a user"
    echo "5- Unlock a user"
    echo "6- Exit"
    echo "__________________________"
}

check_root

while true; do
    show_menu
    read -p "Choose an option: " choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) lock_user ;;
        5) unlock_user ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please select a valid choice." ;;
    esac
done 