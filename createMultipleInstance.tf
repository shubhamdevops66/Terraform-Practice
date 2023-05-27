provider "aws" {
  region     = var.region
  shared_credentials_files = ["~/.aws/credentials"]
}


resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  count = 3
  availability_zone = element(var.availability_zone,count.index)
  tags = {
    Name = "${var.environment}-${count.index}"
  }
}
