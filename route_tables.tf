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
  subnet_id = aws_subnet.public_subnet_main.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private_subnet_main.id
  route_table_id = aws_route_table.rt_private.id
}