resource "aws_eip" "eip_nat" {
  vpc = true

  tags = {
    Name = "elasticIP"
  }
}

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.pub-sub-1.id

  tags = {
    "Name" = "natgateway"
  }
}
