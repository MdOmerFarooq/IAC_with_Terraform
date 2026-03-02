# This Terraform configuration file creates an EC2 instance in AWS using the latest Ubuntu AMI.

provider "aws" {    # This block configures the AWS provider, which allows Terraform to interact with AWS services.
    region = "ap-south-1"
}

# Fetch the latest Ubuntu AMI, filtering by name and owner to ensure we get the correct image from Canonical 
# This is Done avoid hardcoding the AMI ID which can change over time.

data "aws_ami" "ubuntu" {
    most_recent = true   # condition to fetch/select the most recent AMI that matches the filter criteria
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = ["099720109477"] # Canonical is the owner of official Ubuntu AMIs, so we specify their owner ID to ensure we get the correct images.
}

resource "aws_instance" "my_ec2" {  # resource block to create an EC2 instance, with the name "my_ec2"
    ami = data.aws_ami.ubuntu.id    # The AMI ID is obtained from the data source defined above, which fetches the latest Ubuntu AMI.
    instance_type = "t2.micro"
    key_name = "test-ec2-key.pem"
    tags = {
        Name = "MyEC2Instance"      
    }
}
