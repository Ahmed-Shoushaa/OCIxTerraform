#!/bin/bash
sudo apt update
sudo apt install apache2
echo "Hello Wind-Is It's Ahmed 🫡" > /var/www/html/index.html

# For red hat based 
# sudo yum install -y httpd
# sudo systemctl enable httpd
# sudo systemctl restart httpd
# echo "Hello Wind-Is It's Ahmed 🫡" > /var/www/html/index.html
