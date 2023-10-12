# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "Demo IGW"
  }
}

# Create Web layber route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.vpc-1.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "routes"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.web-rt.id
}
