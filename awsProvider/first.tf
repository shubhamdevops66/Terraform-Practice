
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
  ami = "ami-0800fc0fa715fdcfe"
  instance_type = "t2.micro"

}
