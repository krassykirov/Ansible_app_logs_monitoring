#!/bin/bash
logpath=/var/log/app  # app logs directory path
limit=90              # limit of Use% 
min_logs_size=200     # left some minimum size of logs for debug if needed

while true
do
# get use% for '/'
disk_root_usage_percent=$(df / | tail -1 | sed 's/%//g' | awk '{print $5}') 
# get usage of /var/log/app directory in MB'
logs_dir_usage=$(sudo du -BM $logpath -s | cut -f1 | sed 's/M//')   
# check if the log size is lower than min_size_logs limit in MB and if so exit 
if [ $logs_dir_usage -lt $min_logs_size ]; then 
exit 0
fi
# check if the total_size is lower than the use limit of 90% and if so exit
if [ $disk_root_usage_percent -lt $limit ]; then 
exit 0
fi
# delete the last modified file in /var/log/app until one of the above conditions are met
file_to_delete=$(ls -t1 $logpath | tail -1)
echo "deleting file: $file_to_delete"
# sudo find $logpath -type f -name "*.log" -mmin +1440 -delete 

# check for safety, True if file exists and is a regular file
if [ ! -f "$logpath/$file_to_delete" ]; then
exit
fi
# [ ! -f $file_to_delete ] && exit

/bin/rm "$logpath/$file_to_delete"

done


