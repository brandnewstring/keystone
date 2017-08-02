# Openstack Keystone in Docker
Dokerized openstack keystone for your convenience.

## Objective and Info
This docker container is installed strictly according to official installation guide https://docs.openstack.org/keystone/latest/install/index-ubuntu.html.

For simplicity and independency, database is not installed.

Keystone version: Ocata (latest version for the creation date) 
Ubuntu version: 16.04

## How to get the image
You can clone from here or just by 

## How to use
```docker run -d -p 5000:5000 -p 35357:35357 -v `pwd`/keystone.conf:/etc/keystone/keystone.conf keystone```
Don't forget to mount keystone.conf

## Verify
Enter into the container and do:
```
$source openrc
$openstack user list
```

You should see:
```
+----------------------------------+-------+
| ID                               | Name  |
+----------------------------------+-------+
| 64a27695cc34460dbb2f5fdce1153dc6 | admin |
+----------------------------------+-------+
```
