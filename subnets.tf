resource "aws_subnet" "private_subnet_main" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_private_main

  tags = {
    Name = "ka_private_subnet_main"
  }
}

resource "aws_subnet" "private_subnet_second" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_private_second

  tags = {
    Name = "ka_private_subnet_second"
  }
}


resource "aws_subnet" "public_subnet_main" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_public_main

  tags = {
    Name = "ka_public_subnet_main"
  }
}

resource "aws_subnet" "public_subnet_second" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_public_second

  tags = {
    Name = "ka_public_subnet_second"
  }
}