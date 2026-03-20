# This file contains the main configuration for the EC2 instance.
provider "aws" {
  region = "ap-south-1"
}

# The below block will fetch the latest Amazon Linux 2 AMI ID 
data "aws_ami" "aws" {
    most_recent = true
    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    owners = ["137112412989"] # Amazon
}

module "create_ec2" {
    source = "./ec2_module"
    instance_type = var.instance_type
    my_keypair = var.my_keypair
    ami_id = data.aws_ami.aws.id
}
