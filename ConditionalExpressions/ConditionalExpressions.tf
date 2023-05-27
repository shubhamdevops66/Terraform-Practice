provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "istest" {
default = false
}

resource "aws_instance" "testenv" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform1234"
  }

    count =var.istest == true ? 1 : 0
    }


resource "aws_instance" "prodenv" {
  ami           = var.ami
  instance_type = "t2.large"

  tags = {
    Name = "Terraform1345"
  }

    count =var.istest == false ? 1 : 0
    }
