- Ansible main.yml file contains first run where we create an User, Group 
  and Directory required for the Application
  
- Two bash script: disk_space_monitor.sh for disk usage monitoring and remediation.sh 
  to recreate user, group and app directory if removed by mistake
 
- The scripts will be copied to the remote hosts /usr/local/bin folder 
   and configured to run with cron jobs 
  
	  
