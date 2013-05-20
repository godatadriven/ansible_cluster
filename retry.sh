#!/bin/sh
sudo cobbler system edit --name=node01 --netboot-enabled=True
sudo cobbler system edit --name=node02 --netboot-enabled=True
sudo cobbler system edit --name=node03 --netboot-enabled=True

sudo cobbler sync

#ansible-playbook bootstrap.yml -t init -u root --ask-pass
#ansible-playbook cluster.yml

