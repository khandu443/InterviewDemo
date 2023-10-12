# Create a VPC
resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-1"
  }
}

# Create Web Public Subnet
resource "aws_subnet" "pub-sub-1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-1a"
  }
}

resource "aws_subnet" "pub-sub-2" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-2b"
  }
}

# Create Application Private Subnet
resource "aws_subnet" "private-sub-1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "app-srv-1a"
  }
}

resource "aws_subnet" "private-sub-2" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "app-srv-2b"
  }
}

# Create Database Private Subnet
resource "aws_subnet" "rds-sub-1" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "rds-1a"
  }
}

resource "aws_subnet" "rds-sub-2" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "rds-2b"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.rds-sub-1.id, aws_subnet.rds-sub-2.id]

  tags = {
    Name = "rds subnet group"
  }
}
