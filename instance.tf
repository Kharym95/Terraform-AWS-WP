resource "aws_instance" "ka_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ka_ssh.id
  subnet_id              = aws_subnet.public_subnet_main.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
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
    sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sudo chown -R www-data:www-data /var/www/html
    sudo chmod -R 755 /var/www/html
    sudo sed -i "s/database_name_here/"${var.db_name}"/" /var/www/html/wp-config.php
    sudo sed -i "s/username_here/"${var.db_username}"/" /var/www/html/wp-config.php
    sudo sed -i "s/password_here/"${var.db_password}"/" /var/www/html/wp-config.php
    sudo sed -i "s/localhost/"${aws_db_instance.kawordpressdb.address}"/" /var/www/html/wp-config.php
  EOF
}