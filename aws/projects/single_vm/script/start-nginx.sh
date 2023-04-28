#!/bin/bash

export DOMAIN_NAME=$(curl -s 'http://169.254.169.254/latest/meta-data/public-hostname')
yum update -y

sed -i '/^\s*http\s*{/a \    server_names_hash_bucket_size 128;' /etc/nginx/nginx.conf

cat <<EOF > /etc/nginx/conf.d/app.conf
server {
  listen 80;
  server_name $DOMAIN_NAME;

  location / {
    add_header Content-Type "text/plain";
    return 200 "$HOSTNAME";
  }
}
EOF

amazon-linux-extras install nginx1.12 -y
systemctl start nginx
service nginx start