# BeDe_tasks

# Solution

1. Ansible main.yml file contain first run creating User, Group and Directory required for the App
2. Two bash script: disk_space_monitor.sh and remediation.sh for disk usage monitorin and recreate user,group, dir if removed

# Configuration: 
   - main.yml eed to be run from ansible directory, assuming also that privileged escaltion has been configured in ansible.cfg
   - Simple usage will be: 
       a) ansible-playbook main.yml 
       b) ansible-playbook main.yml -i inventory -e '{"files_older_than":"1d","disk_space_threshold":0.2}'
  
# Additionally disk_space_monitor.sh and remediation.sh will be copied to /usr/local/bin and configured to run with cron jobs
   one is used for disk space monitoring and the other for remediation

# Example run of main.yml: 
   a) ansible-playbook main.yml 
   b) ansible-playbook main.yml -i inventory -e '{"files_older_than":"1d","disk_space_threshold":0.2}'

