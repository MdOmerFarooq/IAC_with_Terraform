provider "aws" {
  region = "ap-south-1"
}

data "aws_instance" "status_vm" {
    instance_id = "i-05089e51e69964631"
}

output "my_instance_status" {
    value = data.aws_instance.status_vm.instance_state
}
