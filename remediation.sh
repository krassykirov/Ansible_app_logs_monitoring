#!/bin/bash
GROUP=devops
USER=app
DIR='/var/log/app'

# create DIR if not exist
mkdir -p $DIR

# create GROUP if not exist
getent group $GROUP
if [ $? -ne 0 ]; then
    sudo groupadd $GROUP
    sudo chown root:$GROUP $DIR
    sudo chmod 774 $DIR
fi

# create USER if not exist
getent passwd $USER
if [ $? -ne 0 ]; then
    sudo useradd $USER -m -s /bin/bash -g $GROUP
    echo "$USER:secretpass" | chpasswd
fi
