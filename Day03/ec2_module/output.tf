output "ec2_instance_name" {
    value = aws_instance.my-ec2-instance.tags["Name"]
}

output "ec2_instance_id" {
    value = aws_instance.my-ec2-instance.id
}

output "ec2_instance_ip" {
  value = aws_instance.my-ec2-instance.public_ip
}


            