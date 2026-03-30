#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Priyanshu Kashyap | Regn: 24BSA10015
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Reports size, owner, and permissions of key dirs
# ============================================================

# --- Directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot")

echo "========================================================"
echo "        DISK AND PERMISSION AUDITOR"
echo "========================================================"
echo ""
echo "Scanning key Linux system directories..."
echo ""

printf "%-20s %-25s %-10s\n" "DIRECTORY" "PERMISSIONS/OWNER" "SIZE"
echo "------------------------------------------------------------"

# --- Loop through directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "%-20s %s\n" "$DIR" "[ does not exist ]"
    fi
done

echo ""
echo "--------------------------------------------------------"
echo " LINUX KERNEL MODULES DIRECTORY CHECK"
echo "--------------------------------------------------------"

KERNEL_DIR="/lib/modules/$(uname -r)"

if [ -d "$KERNEL_DIR" ]; then
    echo ""
    echo " Kernel modules directory: $KERNEL_DIR"

    KPERMS=$(ls -ld "$KERNEL_DIR" | awk '{print $1, $3, $4}')
    KSIZE=$(du -sh "$KERNEL_DIR" 2>/dev/null | cut -f1)

    echo " Permissions : $KPERMS"
    echo " Size        : $KSIZE"
    echo ""
    echo " Contains loadable kernel modules (.ko files)."
else
    echo " Kernel modules directory not found for: $(uname -r)"
fi

echo ""
echo "========================================================"