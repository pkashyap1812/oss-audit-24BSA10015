#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Priyanshu Kashyap | Regn: 24BSA10015
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Displays system information like a welcome screen
# ============================================================

# --- Variables ---
STUDENT_NAME="Priyanshu Kashyap"
SOFTWARE_CHOICE="Linux Kernel"

# --- Collect system information ---
KERNEL=$(uname -r)

# Handle distro safely (works even if lsb_release not installed)
if command -v lsb_release >/dev/null 2>&1; then
    DISTRO=$(lsb_release -d | cut -f2)
else
    DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
fi

USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')

# --- Display ---
echo "========================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY"
echo "========================================================"
echo ""
echo " Student     : $STUDENT_NAME"
echo " Software    : $SOFTWARE_CHOICE"
echo ""
echo "--------------------------------------------------------"
echo " SYSTEM INFORMATION"
echo "--------------------------------------------------------"
echo " Distribution: $DISTRO"
echo " Kernel Ver. : $KERNEL"
echo " Logged User : $USER_NAME"
echo " Home Dir    : $HOME_DIR"
echo " Uptime      : $UPTIME"
echo " Date & Time : $CURRENT_DATE"
echo ""
echo "--------------------------------------------------------"
echo " LICENSE INFORMATION"
echo "--------------------------------------------------------"
echo " The Linux Kernel is licensed under GNU GPL v2."
echo " You are free to:"
echo " - Use this OS for any purpose"
echo " - Study and modify the source code"
echo " - Distribute copies"
echo " - Share modifications under GPL v2"
echo ""
echo "========================================================"
echo " 'Free as in freedom, not free as in free beer.'"
echo " — Richard Stallman"
echo "========================================================"