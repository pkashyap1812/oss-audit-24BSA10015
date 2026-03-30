#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Priyanshu Kashyap | Regn: 24BSA10015
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Takes user input and generates a manifesto file
# ============================================================

echo "========================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "========================================================"
echo ""
echo "Answer three questions to generate your manifesto."
echo ""

# --- Inputs ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Metadata ---
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

echo ""
echo "Generating your manifesto..."
echo ""

# --- Write file ---
{
echo "========================================"
echo "        MY OPEN SOURCE MANIFESTO"
echo " Generated on: $DATE"
echo " By: $USER_NAME"
echo "========================================"
echo ""
echo "I believe in the power of open source software."
echo ""
echo "Every day, I rely on $TOOL — a tool that exists"
echo "not because a corporation sells it,"
echo "but because someone shared it freely."
echo ""
echo "To me, freedom means $FREEDOM."
echo "In software, that freedom is the foundation:"
echo "the freedom to read, modify, learn, and share."
echo ""
echo "One day, I want to build $BUILD and release it openly,"
echo "continuing the cycle of shared knowledge."
echo ""
echo "The Linux Kernel started as a student's project."
echo "Today it powers the internet and billions of devices."
echo ""
echo "This is my commitment to open source."
echo ""
echo "Signed: $USER_NAME | $DATE"
echo "========================================"
} > "$OUTPUT"

# --- Display ---
echo "--------------------------------------------------------"
echo " YOUR MANIFESTO (saved to: $OUTPUT)"
echo "--------------------------------------------------------"
echo ""

cat "$OUTPUT"

echo ""
echo "========================================================"
echo " File saved successfully: $OUTPUT"
echo "========================================================"