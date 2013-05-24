ansible_cluster
===============

```
export ANSIBLE_HOSTS=~/ansible_cluster/hosts
```

Cobbler setup:

http://localhost/cobbler_web
Username: cobbler / Password: cobbler

Import the CentOS ISO:
```
mount -t iso9660 -o loop /opt/repo/CentOS-6.4-x86_64-bin-DVD1.iso /mnt/dvd
cobbler import --path=/mnt/dvd --name=CentOS64
```

Adding Cobbler systems:
```
sudo cobbler system edit --name=node01 --profile=CentOS64-x86_64 --hostname=node01 --mac=00:25:22:97:AD:96 --ip-address=10.0.0.101 --static=True
sudo cobbler system edit --name=node02 --profile=CentOS64-x86_64 --hostname=node02 --mac=00:25:22:97:AC:9E --ip-address=10.0.0.102 --static=True
```

To re-enable the netboot flag:
```
sudo cobbler system edit --name=node01 --netboot-enabled=True
sudo cobbler system edit --name=node02 --netboot-enabled=True
```

If you want to have a local version of the yum repo's used:
```

(Download steps can be done on host OS or VM machine. Take sa lot of space so host OS seems the best option)
cd <localrepodir>
wget -r --no-parent --reject "index.html*" http://mirror.centos.org/centos/6/os/x86_64/Packages/
wget -r --no-parent --reject "index.html*" http://mirror.centos.org/centos/6/updates/x86_64/Packages/
wget -r --no-parent --reject "index.html*" http://mirror.centos.org/centos/6/extras/x86_64/Packages/
wget -r --no-parent --reject "index.html*" http://mirror.1000mbps.com/fedora-epel/6/x86_64/

(If previous steps are done on Host OS, make sure <localrepodir> points to the mounted shared disk here!)
sudo createrepo <localrepodir>/archive.cloudera.com/cm4/redhat/6/x86_64/cm/4/
sudo createrepo <localrepodir>/mirror.1000mbps.com/fedora-epel/6/x86_64/
sudo createrepo <localrepodir>/mirror.centos.org/centos/6/updates/x86_64/
sudo createrepo <localrepodir>/mirror.centos.org/centos/6/extras/x86_64/
sudo createrepo <localrepodir>/mirror.centos.org/centos/6/os/x86_64/

sudo ln -s <localrepodir>/archive.cloudera.com /var/www/html/archive.cloudera.com
sudo ln -s <localrepodir>/mirror.centos.org /var/www/html/mirror.centos.org
sudo ln -s <localrepodir>/mirror.1000mbps.com/ /var/www/html/mirror.1000mbps.org

add local-repo.yml to the bootstrap playbook instead of the repo.yml and proxy.yml
Make sure local-repo is at the top of the bootstrap.yml!!
```