# Email2taskwarrior
Simple solution to create tasks via email in taskworrior

## Description
Taskwarrior is a great solution for TODO lists but unfortunately not available everywhere.
With email2task you can send yourself a new task via email. **A separate e-mail-account is required since all e-mails are read and deleted.**

## Installation
Clone the repo or copy email2task.sh to your computer
after that, the following parameters still have to be adjusted

access="user@mailhost.com:topsecret"  
host="imaps://mailhost.com"  
logfile="/var/log/email2task.log"   

Make sure you have write-access to the logfile
