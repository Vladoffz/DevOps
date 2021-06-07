provider "aws" {
  region     = "us-east-2"
}

variable "name_ansible" {
  default = "EPAMFinalAnsibleServer"
}

resource "aws_instance" "EPAM_Final_Ansible" {
  ami                    = "ami-0b9064170e32bde34"
  instance_type          = "t2.micro"
  key_name               = "vlad-key-Ohio"
  vpc_security_group_ids = [aws_security_group.EPAM_Final_Ansible.id]
}
resource "aws_security_group" "EPAM_Final_Ansible" {
  name        = "MyAnsibleServer Security Group"
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
