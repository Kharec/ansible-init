#!/bin/bash

if [ -z $1 ]
then 
    echo "$0 <path>"
    exit 1
fi

ansiblePath=$1

mkdir -p $ansiblePath
cd $ansiblePath

mkdir bin env lib play ssh roles
touch README.md ansible.cfg requirements.yml ssh/config env/inventory.ini main.yml
mkdir env/group_vars env/host_vars

echo "[defaults]
inventory = env/inventory.ini
roles_path = roles

[ssh_connection]
ssh_args = -F ssh/config -C -o ControlMaster=auto -o ControlPersist=60s" > ansible.cfg

echo "Don't forget to : 

- add your keys in ssh/
- add your servers and groups in env/inventory.ini"

exit 0
