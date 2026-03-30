# OSS Capstone Project — Linux Kernel Audit

**Student Name:** Priyanshu Kashyap  
**Roll Number:** 24BSA10015  
**Course:** Open Source Software  
**Chosen Software:** Linux Kernel  
**Date:** 31 March 2026  

---

## About This Project
This repository contains five shell scripts written as part of
the Open Source Software Capstone Project. The chosen software
is the Linux Kernel. All scripts were tested on Ubuntu 24.04.3
LTS running kernel 6.14.0-35-generic.

---

## Scripts

### Script 1 — System Identity Report
Displays system information like a welcome screen showing
kernel version, logged-in user, uptime, and GPL v2 license info.

### Script 2 — FOSS Package Inspector
Checks if the Linux kernel package is installed, shows version
and license details, and prints a philosophy note using a
case statement.

### Script 3 — Disk and Permission Auditor
Loops through key Linux directories and reports their
permissions, owner, and size using a for loop.

### Script 4 — Log File Analyzer
Reads a log file line by line, counts keyword occurrences
using a while loop and counter variable, and prints the
last 5 matching lines.

### Script 5 — Open Source Manifesto Generator
Asks the user 3 interactive questions and generates a
personalised open source philosophy statement saved to a .txt file.

---

## How to Run the Scripts

### Requirements
- Ubuntu / Debian Linux system
- Bash shell
- sudo access (for Script 4)

### Steps

**1. Clone this repository:**
```bash
git clone https://github.com/pkashyap1812/oss-audit-24BSA10015.git
cd oss-audit-24BSA10015
```

**2. Make scripts executable:**
```bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
```

**3. Run each script:**
```bash
./script1.sh
./script2.sh
./script3.sh
sudo ./script4.sh /var/log/syslog error
./script5.sh
```

---

## Dependencies
- `lsb_release` — for distro name (pre-installed on Ubuntu)
- `dpkg` — for package info (pre-installed on Ubuntu)
- `sudo` access — required for Script 4 to read syslog

---

## License
All shell scripts in this repository are submitted as part of
the VIT Bhopal OSS Capstone Project by Priyanshu Kashyap (24BSA10015).

