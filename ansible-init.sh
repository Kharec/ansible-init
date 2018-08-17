#!/bin/bash

if [ -z $1 ]
then 
    echo "$0 <path>"
    exit 1
fi

ansiblePath=$1

mkdir -p $ansiblePath
cd $ansiblePath

mkdir bin env lib play ssh roles tasks
touch README.md ansible.cfg requirements.yml ssh/config env/inventory.ini main.yml
mkdir env/group_vars env/host_vars

echo "[defaults]
inventory = env/inventory.ini
roles_path = roles

[ssh_connection]
ssh_args = -F ssh/config -C -o ControlMaster=auto -o ControlPersist=60s" > ansible.cfg

echo "[+] Generating a ssh key for your project..."
ssh-keygen -t rsa -N "" -f ./ssh/id_rsa 

echo "Ready to go. Don't forget to add your servers and groups in env/inventory.ini"

exit 0
