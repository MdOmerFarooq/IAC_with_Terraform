variable "instance_type" {
    description = "The type of instance to create"
    type        = string
    default     = "t2.micro"
}

variable "my_keypair" {
    description = "The name of the key pair to use for the EC2 instance"
    type        = string
}

variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instance"
    type        = string
}