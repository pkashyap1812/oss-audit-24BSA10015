#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Priyanshu Kashyap | Regn: 24BSA10015
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Reads a log file, counts keyword matches,
# and shows last matches
# Usage: ./log_analyzer.sh [logfile] [keyword]
# Example: ./log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Inputs ---
LOGFILE=${1:-/var/log/syslog}
KEYWORD=${2:-"error"}
COUNT=0

echo "========================================================"
echo "              LOG FILE ANALYZER"
echo "========================================================"
echo ""
echo " Log File : $LOGFILE"
echo " Keyword  : '$KEYWORD'"
echo ""

# --- File exists check ---
if [ ! -f "$LOGFILE" ]; then
    echo " ERROR: File '$LOGFILE' not found."
    echo " Try: sudo ./log_analyzer.sh /var/log/syslog error"
    exit 1
fi

# --- Empty file handling ---
if [ ! -s "$LOGFILE" ]; then
    echo " WARNING: '$LOGFILE' is empty. Trying /var/log/kern.log instead..."
    LOGFILE="/var/log/kern.log"

    if [ ! -s "$LOGFILE" ]; then
        echo " ERROR: Backup log file is also empty."
        exit 1
    else
        echo " Using: $LOGFILE"
    fi
fi

echo " Scanning file..."
echo ""

# --- Count matches ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Results ---
echo "--------------------------------------------------------"
echo " RESULT SUMMARY"
echo "--------------------------------------------------------"
echo " Keyword '$KEYWORD' found $COUNT times in:"
echo " $LOGFILE"
echo ""

# --- Last 5 matches ---
echo " Last 5 matching lines:"
echo "--------------------------------------------------------"

grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while read -r MATCH; do
    echo " >> $MATCH"
done

echo ""
echo "========================================================"