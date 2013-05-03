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
