provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = data.aws_vpc.main.id
  name   = "allow_ssh"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-05576a079321f21f8"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "example-instance"
  }
}