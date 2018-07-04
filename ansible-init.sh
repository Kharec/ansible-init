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
touch README.md ansible.cfg requirements.yml ssh/config env/inventory.ini
mkdir env/group_vars env/host_vars

echo "Don't forget to : 

- add your keys in ssh/
- add your configuration in ansible.cfg
- add your servers and groups in env/inventory.ini"

exit 0
