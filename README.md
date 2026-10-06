# 🐧 Real-Time Linux User Management CLI Tool

An interactive, Bash-based **Linux User Management CLI Tool** designed to automate common user lifecycle and system administration tasks.

The project demonstrates practical Linux administration, Bash scripting, input validation, privilege management, user/group administration, and account access control — concepts commonly used in **Linux, DevOps, Cloud, and System Administration** environments.

![Linux User Management CLI](https://github.com/user-attachments/assets/0b1029c9-3fcd-4cad-93da-d84092c457b3)

---

## 📌 Project Overview

Managing Linux users manually can become repetitive and error-prone, especially when handling tasks such as:

- Developer onboarding
- Intern or contractor access
- User group assignment
- Temporary account suspension
- User account cleanup
- Permission-related administration

This project provides an interactive command-line interface that automates these common operations while applying basic validation and safety checks.

The goal was to build a practical Linux administration project rather than simply writing individual shell commands.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Automate common Linux user-management operations
- Practice Bash scripting and shell automation
- Work with Linux system utilities
- Implement root privilege enforcement
- Handle user and group lifecycle operations
- Validate and sanitize user input
- Implement safe account deletion
- Manage temporary account access using lock/unlock operations
- Understand how Linux stores and manages user accounts

---

## ✨ Features

### 🔐 Root Privilege Enforcement

The script verifies that it is being executed with sufficient privileges before performing system-level user-management operations.

```bash
sudo ./user_management.sh

👤 Interactive User Creation
Provides a prompt-driven workflow for creating Linux users.

Features include:

Username input
Password creation
Password confirmation
Input trimming using xargs
Confirmation prompts
Automatic group creation
User-to-group assignment

Example:
Enter username to create: developer

Enter password for 'developer':
Confirm password for 'developer':

User 'developer' created successfully.

Add user to a group? (y/n): y
Enter group name: devteam

Group 'devteam' does not exist.
Create new group? (y/n): y

Group 'devteam' created and user 'developer' added to it.

🗑️ Safe User Deletion

Allows administrators to remove a Linux user through an interactive workflow.

The deletion process includes confirmation before removing the account and its associated home directory.

🔒 Account Lock & Unlock

Supports temporary access management using Linux account locking.

Useful scenarios include:

Temporary employee leave
Intern access suspension
Contractor access management
Temporary account deactivation

Example:
Choose an option: 4

Enter username to lock: developer

User 'developer' has been locked.

Users can later be restored using the unlock operation.

👥 User & Group Management

The tool supports:

User creation
Group creation
Group assignment
User deletion
Account lock
Account unlock

This provides hands-on practice with Linux identity and access management concepts.

📋 System User Enumeration

The tool can list existing Linux user accounts by reading the system's user database:

/etc/passwd

This demonstrates practical usage of Linux system files and command-line processing.

🧹 Input Sanitization

User input is sanitized before processing.

The project uses tools such as:

xargs

to trim unnecessary whitespace and applies pattern matching for confirmation inputs.

For example:

(y/n)
(Y/N)

are handled consistently.

🛠️ Technologies & Linux Utilities
Core
Bash
Linux
Shell Scripting
Linux Utilities
useradd
userdel
groupadd
usermod
passwd
passwd -l
passwd -u
awk
grep
xargs
Concepts Practiced
Linux user management
Linux groups
File permissions
Root privileges
Account lifecycle management
Input validation
Regular expressions
Shell scripting
Exit status handling
Linux system administration
📋 Requirements
Operating System

Supported environments include:

Ubuntu 20.04+
Debian
RHEL
CentOS
WSL on Windows
Privileges

Root or sudo privileges are required because the script performs system-level user and group operations.

Dependencies

The project relies primarily on standard Linux command-line utilities.

Required utilities include:

bash
awk
grep
passwd
xargs
shadow-utils

Most of these are available by default on common Linux distributions.

🚀 Installation & Setup
1. Clone the Repository
git clone https://github.com/Shubhamkahar196/Linux-user-management.git
2. Navigate to the Project
cd Linux-user-management
3. Make the Script Executable
chmod +x user_management.sh
4. Run the Script
sudo ./user_management.sh

🖥️ CLI Menu

After starting the script, an interactive menu is displayed:

__________________________
   User Management Script
__________________________

1- Create a new user
2- Delete a user
3- List all users
4- Lock a user
5- Unlock a user
6- Exit

__________________________

Choose an option:
💡 Example Workflow
Create a Developer Account
Choose an option: 1

Enter username to create: developer

Enter password for 'developer':
Confirm password for 'developer':

User 'developer' created successfully.

Add user to a group? (y/n): y

Enter group name: devteam

Group 'devteam' does not exist.
Create new group? (y/n): y

Group 'devteam' created and user 'developer' added to it.
Lock an Account
Choose an option: 4

Enter username to lock: developer

User 'developer' has been locked.
Unlock an Account
Choose an option: 5

Enter username to unlock: developer

User 'developer' has been unlocked.
📂 Project Structure
Linux-user-management/
│
├── user_management.sh
├── README.md


📖 Build Article

I documented the process of building this project and the Linux/Bash concepts involved in the following article:

Building an Intermediate Linux & Bash Automation Project: User Management CLI Tool
https://www.linkedin.com/pulse/building-intermediate-linux-bash-automation-project-user-kahar-c6wwf/

Read the full article on LinkedIn