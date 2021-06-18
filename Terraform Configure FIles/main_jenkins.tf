provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-2"
}

variable "name_web" {
  default = "FinalJenkinsServer"
}

resource "aws_instance" "EPAM_Final_Jenkins" {
  ami                    = "ami-0b9064170e32bde34"
  instance_type          = "t2.micro"
  key_name               = "vlad-key-Ohio"
  vpc_security_group_ids = [aws_security_group.EPAM_Final_Jenkins.id]
}
resource "aws_security_group" "EPAM_Final_Jenkins" {
  name        = "MyJenkinsServer Security Group"
  description = "added for jenkins connect"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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
