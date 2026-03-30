#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Priyanshu Kashyap | Regn: 24BSA10015
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Checks if key open-source packages are installed,
# shows version info, and prints a philosophy note
# ============================================================

# --- Package to inspect ---
PACKAGE="linux-image-$(uname -r)"

echo "========================================================"
echo "              FOSS PACKAGE INSPECTOR"
echo "========================================================"
echo ""

# --- Check if dpkg exists (Debian/Ubuntu systems) ---
if command -v dpkg >/dev/null 2>&1; then

    # --- Check package installation ---
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo " [INSTALLED] $PACKAGE is installed."
        echo ""
        echo " Package Details:"
        echo " ----------------"
        dpkg -l "$PACKAGE" | awk '/^ii/ {print " Version : " $3}'
        echo " License : GNU GPL v2"
        echo " Summary : Linux kernel — core of the OS"
    else
        echo " [NOT FOUND] $PACKAGE not found via dpkg."
        echo " Showing running kernel info instead."
    fi

else
    echo " dpkg not available on this system."
    echo " Skipping package check."
fi

echo ""

# --- System info ---
echo " Currently Running Kernel : $(uname -r)"
echo " Architecture            : $(uname -m)"
echo " OS                      : $(uname -o)"
echo ""

echo "--------------------------------------------------------"
echo " PHILOSOPHY NOTES"
echo "--------------------------------------------------------"

# --- Case statement ---
BASE_PACKAGE="linux"

case $BASE_PACKAGE in
    linux)
        echo " Linux Kernel: Started in 1991 as a student project."
        echo " Now powers servers, phones, and the internet."
        ;;
    apache2)
        echo " Apache: Made the web accessible to everyone."
        ;;
    mysql-server)
        echo " MySQL: Backbone of millions of applications."
        ;;
    firefox)
        echo " Firefox: Keeps the web open and independent."
        ;;
    vlc)
        echo " VLC: Plays everything. Built by students."
        ;;
    *)
        echo " Part of the open-source ecosystem."
        ;;
esac

echo ""
echo "========================================================"