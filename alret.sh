#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=75
DISK_THRESHOLD=85

TO_EMAIL="karimaraby3344@gmail.com"
SUBJECT="Alert on $(hostname)"
BODY="High Usage in System Resources, Please check the resources"

send_email() {
    echo -e "$BODY" | mail -s "$SUBJECT" "$TO_EMAIL"
}

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    send_email
fi

MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100.0}')
if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    send_email
fi

DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    send_email
fi