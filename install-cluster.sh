#!/bin/sh
ansible-playbook bootstrap.yml -t init -u root --ask-pass
ansible-playbook cluster.yml

sleep 30

/usr/bin/firefox http://10.20.0.101:7180

