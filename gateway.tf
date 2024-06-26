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
  subnet_id = aws_subnet.public_subnet_main.id

  tags = {
    Name = "KA_nat_gw"
  }
}