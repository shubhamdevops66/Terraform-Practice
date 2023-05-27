provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
  ami = "ami-0800fc0fa715fdcfe"
  instance_type = var.instancetype

}

resource "aws_security_group" "sg2" {
  name   = "mysg1"
  ingress {

    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  cidr_blocks= [var.vpn_ip]

  }
  ingress {

    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks= [var.vpn_ip]

  }
  ingress {

    from_port        = 53
    to_port          = 53
    protocol         = "tcp"
    cidr_blocks= [var.vpn_ip]
  }
}

