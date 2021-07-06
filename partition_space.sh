#!/bin/bash 
#######################################################################################
#Script Name    :alertmemory.sh
#Description    :send alert mail when avaible partition's space is under 500 Mo.
#Email          :server.monitor@gmail.com
#License       : GNU GPL-3	
#######################################################################################
## declare mail variables
##email subject 
subject="avaible partition's space is under 500 Mo"
##sending mail as
from="server.monitor@example.com"
## sending mail to
to="server.monitor2@gmail.com"
## send carbon copy to
also_to="server.monitor3@example.com"


df -m | grep -vE '^Filesystem|tmpfs|cdrom|udev' | awk '{ print $4 }' | while read output;
	do
  	if [ $output -le 500 ]; then
    		echo "Attention!! L’espace disponible sur une partition passe sous 500 Mo." | mailx -a "$file" -s "$subject" -r "$from" -c "$to" "$also_to"
  	fi
	