resource "aws_db_instance" "kawordpressdb" {
  identifier           = "kawordpressdb"
  allocated_storage    = 20
  engine               = "mariadb"
  engine_version       = "10.5"
  instance_class       = "db.t3.micro"
  db_name              = "kawordpressdb"
  username             = "wpadmin"
  password             = "password"
  #vpc_security_group_ids = [aws_security_group.rds_sg.id]
  #db_subnet_group_name = aws_db_subnet_group.ka_db_subnet_group.name
  skip_final_snapshot  = true

  tags = {
    Name = "KA_WordPress_RDS"
  }
}

#resource "aws_db_subnet_group" "ka_db_subnet_group" {
#  name = "ka-db-subnet-group"
#  subnet_ids = [aws_subnet.private_subnet.id]
#}

#resource "aws_security_group" "rds_sg" {
#  name        = "ka_rds_sg"
#  description = "Groupe de sécurité pour l'instance wordpress mariadb"
#  vpc_id      = aws_vpc.main_vpc.id


#  ingress {
#    from_port   = 3306
#    to_port     = 3306
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]  
#  }
#}