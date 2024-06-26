resource "aws_instance" "ka_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet_main.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {

    Name = "KA_WordPress"
  }
  root_block_device {

    volume_type = "gp3"
    volume_size = 10
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install apache2 php libapache2-mod-php mysql-server php-mysql -y
    sudo systemctl enable apache2
    sudo systemctl start apache2
    cd /var/www/html
    sudo rm -f index.html
    sudo wget https://wordpress.org/latest.tar.gz
    sudo tar -xzf latest.tar.gz
    sudo mv wordpress/* .
    sudo rm -r wordpress latest.tar.gz
    sudo chown -R www-data:www-data /var/www/html
    sudo chmod -R 755 /var/www/html
  EOF
}