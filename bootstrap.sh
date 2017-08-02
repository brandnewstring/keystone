su -s /bin/sh -c "keystone-manage db_sync" keystone

keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone

keystone-manage bootstrap --bootstrap-password $KEYSTONE_ADMIN_PASSWORD \
  --bootstrap-admin-url http://$CONTROLLER:35357/v3/ \
  --bootstrap-internal-url http://$CONTROLLER:5000/v3/ \
  --bootstrap-public-url http://$CONTROLLER:5000/v3/ \
  --bootstrap-region-id RegionOne

echo "ServerName $CONTROLLER" >> /etc/apache2/apache2.conf

cat > /openrc <<EOF
export OS_USERNAME=admin
export OS_PASSWORD=$KEYSTONE_ADMIN_PASSWORD
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://$CONTROLLER:35357/v3
export OS_IDENTITY_API_VERSION=3
EOF

service keystone start
apache2ctl -D FOREGROUND
