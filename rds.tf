resource "aws_db_instance" "kawordpressdb" {
  identifier           = var.rds_identifier
  allocated_storage    = var.rds_allocated_storage
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  storage_encrypted    = true 
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name = aws_db_subnet_group.ka_db_subnet_group.name
  skip_final_snapshot  = true

  tags = {
    Name = "KA_WordPress_RDS"
  }
}

resource "aws_db_subnet_group" "ka_db_subnet_group" {
  name = var.rds_db_subnet_group
  subnet_ids = [
  aws_subnet.private_subnet_main.id,
  aws_subnet.private_subnet_second.id,
  aws_subnet.public_subnet_main.id,
  aws_subnet.public_subnet_second.id
]

  tags = {
    Name = "ka_db_subnet_group"
  }
}