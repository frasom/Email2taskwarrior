# Email2taskwarrior
Simple solution to create tasks via email in taskworrior

## Description
Taskwarrior is a great solution for TODO lists but unfortunately not available everywhere.
With email2task you can send yourself a new task via email. **A separate email account is required as all emails are read and then deleted.**
the script uses IMAP, so the mail server should also support the IMAP protocol

## Installation
Clone the repo or copy email2task.sh to your computer
after that, the following parameters still have to be adjusted

access="user@mailhost.com:topsecret"  
host="imaps://mailhost.com"  
logfile="/var/log/email2task.log"   

Make sure you have write-access to the logfile

## Usage

Send a Email (text no HTML) to your Taskwarrior-Email Account
Subject:    whatever you want, it will not be used
Text/Body:  {task command} 
Example:    add Pay the rent

On your computer start **email2task.sh** 

_You can also run the script automatically every time you start the system._