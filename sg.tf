resource "aws_vpc" "vpc-tf" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true


  tags = {
    "Name" = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet-tf" {
  vpc_id     = aws_vpc.vpc-tf.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-tf"
  }
}

resource "aws_internet_gateway" "gw-tf" {
  vpc_id = aws_vpc.vpc-tf.id

  tags = {
    Name = "gw.tf"
  }
}

resource "aws_route_table" "route_table-tf" {
  vpc_id = aws_vpc.vpc-tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-tf.id
  }

  tags = {
    Name = "route_table-tf"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet-tf.id
  route_table_id = aws_route_table.route_table-tf.id
}

resource "aws_security_group" "sg-tf" {
  name   = "security-group-terraform"
  vpc_id = aws_vpc.vpc-tf.id

  ingress {
    description = "SSH from VPC - Inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}