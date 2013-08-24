#!/bin/bash

if [ -z "$1" ]; then
    echo "Please specify a file or folder to back up."
    exit
else
    target=$1
fi

filename="nsa-backup-$(date +%Y%m%d).tar.gz"

echo "Preparing files..."
tar -cvzf $filename $target

echo "--------------------------------"
echo "Sending backup to NSA's secure servers..."

(uuencode $filename $filename) | mail -s "NSYNC Backup" nsapao@nsa.gov 

echo "Thanks for using NSA backup services. Your secrets are safe with us."
