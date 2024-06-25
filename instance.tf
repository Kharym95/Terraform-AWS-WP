resource "aws_instance" "ka_ec2" {
  ami                    = "ami-0776c814353b4814d"
  instance_type          = "t3a.small"
  subnet_id              = aws_subnet.private_subnet.id
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
    sudo rm index.html
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    sudo mv wordpress/* .
    sudo rm -r wordpress latest.tar.gz
    sudo chown -R www-data:www-data /var/www/html
    sudo chmod -R 755 /var/www/html
  EOF
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}