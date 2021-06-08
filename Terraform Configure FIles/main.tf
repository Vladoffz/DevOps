provider "aws" {
  region     = "us-east-2"
}

variable "name" {
  default = "EPAMFrontend"
}

resource "aws_instance" "EPAM_Final_Frontend" {
  ami                    = "ami-0b9064170e32bde34"
  instance_type          = "t2.micro"
  key_name               = "vlad-key-Ohio"
  vpc_security_group_ids = [aws_security_group.EPAM_Final_Frontend.id]
}

resource "aws_security_group" "EPAM_Final_Frontend" {
  name        = "MyFrontendServer Security Group"
  description = "added for nginx connect"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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
