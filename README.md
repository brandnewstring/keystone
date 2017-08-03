# Openstack Keystone in Docker
Dokerized openstack keystone for your convenience.

## Objective and Info
This docker container is installed strictly according to official installation guide (https://docs.openstack.org/keystone/latest/install/index-ubuntu.html).

For simplicity and independency, database is not installed.

Keystone version: Ocata (latest version for the creation date) 
Ubuntu version: 16.04

## How to get the image
You can clone from here or just by 
```
$docker pull brandnewstring/keystone
```
## Prerequities
The following is exactly the same as what on keystone official site for keystone installation (https://docs.openstack.org/keystone/latest/install/keystone-install-ubuntu.html).
Please create your own database and create keystone database:
```
CREATE DATABASE keystone;
```
Grant proper access to the keystone database:
```
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' \
IDENTIFIED BY 'KEYSTONE_DBPASS';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' \
IDENTIFIED BY 'KEYSTONE_DBPASS';
```

## How to use
```docker run -d -p 5000:5000 -p 35357:35357 -v `pwd`/keystone.conf:/etc/keystone/keystone.conf keystone```

Don't forget to at least modify password and database address in keystone.conf and mount keystone.conf.

## Verification
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
