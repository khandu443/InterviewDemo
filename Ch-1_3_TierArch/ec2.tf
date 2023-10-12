#Create EC2 Instance
resource "aws_instance" "web-1" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.pub-sub-1.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server 1"
  }

}

resource "aws_instance" "web-2" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.pub-sub-2.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server 2"
  }

}

resource "aws_instance" "app-srv-1" {
  ami                    = ami-0d5eff06f840b45e9
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private-sub-1.id
  vpc_security_group_ids = [aws_security_group.app-sg.id]
  key_name               = "source_key"

  tags = {
    Name = "app-asg"
  }
}

resource "aws_instance" "app-srv-2" {
  ami                    = ami-0d5eff06f840b45e9
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private-sub-1.id
  vpc_security_group_ids = [aws_security_group.app-sg.id]
  key_name               = "source_key"

  tags = {
    Name = "app-asg"
  }
}
