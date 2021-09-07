# Solution

1. Ansible main.yml file contains first run where we create an User, Group and Directory required for the App
2. Two bash script: disk_space_monitor.sh for disk usage monitoring and remediation.sh for remediation (recreate user, group, directory if removed)
3. The scripts disk_space_monitor.sh and remediation.sh will be copied to remote hosts /usr/local/bin and configured to run with cron jobs 

# Configuration: 
   - main.yml need to be run from ansible directory, assuming also that privileged escaltion has been configured in ansible.cfg
   - Simple usage will be: 
       a) ansible-playbook main.yml 
       b) ansible-playbook main.yml -i inventory -e '{"files_older_than":"1d","disk_space_threshold":0.2}'
  
