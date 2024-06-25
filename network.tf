resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ka_vpc"
  }
}

 
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.22.0/24"

  tags = {
    Name = "ka_private_subnet"
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.222.0/24"

  tags = {
    Name = "ka_public_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "KA_igw"
  }
}

resource "aws_eip" "ip_nat_gw" {
#  vpc = true 
  tags = {
    Name = "KA_eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.ip_nat_gw.id
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "KA_nat_gw"
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name= "ka_public_rt"
  }
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name= "ka_private_rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.rt_private.id
}