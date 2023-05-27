provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
  ami = "ami-0800fc0fa715fdcfe"
  instance_type = "t2.micro"
  key_name = "TFkey"
  
provisioner "remote-exec" {
    inline = [
"sudo amazon-linux-extras install -y nginx1.12",
"sudo systemctl start nginx"
  ]
 
connection {
  type = "ssh"
  user = "ec2-user"
  private_key = file("./TFkey.pem")
  host = self.public_ip
}
}
}
