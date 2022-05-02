#!/bin/bash
# Frank Sommer / frank@sommers.cloud
# Simple solution to create tasks via email in taskworrior
# you need a separate email for taskwarrior
# date: 2022-05-01

set -e                                              # abort in case of error

access="user@mailhost.com:topsecret"                # username:credentials
host="imaps://mailhost.com"                         # host url
logfile="/var/log/email2task.log"                   # log file, make shure that you have access

# get number of emails 
anz=$(curl --silent --url $host --user $access -X 'SELECT INBOX' |grep EXISTS | cut -c 3-4)
echo "$(date "+%F %H:%M:%S") $anz New Mails" >> $logfile

for((i=0; i<$anz; i++))
    do
    # fetch email from server 
    commopt=$(curl --silent --url $host"/INBOX;MAILINDEX=1;SECTION=Text" --user $access)
    echo "$(date "+%F %H:%M:%S") MailID $i $commopt" >> $logfile
    # create task
    task $commopt
    # delete email, after deleting the next email gets the number 1
    curl --silent --url $host"/INBOX;MAILINDEX=1" --user $access -X "STORE 1 +Flags \Deleted"
    curl --silent --url $host"/INBOX;MAILINDEX=1" --user $access -X "EXPUNGE"
done
exit 0
