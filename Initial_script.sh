#!/bin/bash
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl restart httpd
echo "Hello Wind from Ahmed" > /var/www/html/index.html
# sudo firewall-cmd --add-service=http --permanent
# Enable HTTPS connections on port 443 
# sudo firewall-cmd --add-service=https --permanent
# reload firewall
# sudo firewall-cmd --reload