#!/bin/bash

USERID=$(id -u)

LOGS_FOLDER="LOGSTORE"
LOGS_FILE="$LOGS_FOLDER/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Check if user has root access or not
if [ $USERID -ne 0 ]; then
        echo -e "$R Please run the script with root access $N" | tee -a $LOGS_FILE
        exit 1
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILURE $N" | tee -a $LOGS_FILE
        exit 1
else
        echo -e "$2 ... $G SUCCESS $N" | tee -a $LOGS_FILE
fi
}

# Check if nginx is installed or not
if rpm -q nginx &>/dev/null; then
        echo -e "nginx is already installed ..." | tee -a "$LOGS_FILE"
else
        echo -e "nginx is not installed. $Y Installing... $N" | tee -a "$LOGS_FILE"
        dnf install nginx -y &>>$LOGS_FILE
        VALIDATE $? "Installing nginx..."
fi

# Check if nginx is enabled & running or not
if systemctl is-active --quiet nginx; then
        echo -e  "nginx is running"
else
        echo -e "nginx is not running...$Y Starting... $N" | tee -a "$LOGS_FILE"
        systemctl enable --now nginx
        VALIDATE $? "Starting nginx..."
fi