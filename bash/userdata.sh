#!/bin/bash
yum update -y
sudo yum install -y ruby
sudo yum install -y wget
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo dnf install -y php php-cli php-mysqlnd php-mbstring php-xml
