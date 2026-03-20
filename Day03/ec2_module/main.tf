resource "aws_instance" "my-ec2-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.my_keypair
  tags = {
    Name = "MyEc2Instance"
  }
}


