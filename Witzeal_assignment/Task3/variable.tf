variable "region" {
  default     = "eu-west-1"
  description = "AWS region where the instance will be deployed"
  type        = string
}

variable "private_key_path" {
  default     = "/home/ec2-user/my_aws_account.pem"
  description = "pem key to access the server"
  type        = string
}


variable "instance_type" {
  default     = "t4g.small"
  description = "EC2 instance type (size of the instance)"
  type        = string
}

variable "key" {
  default     = "my_aws_account"
  description = "Name of the SSH key to be installed on the instance"
  type        = string
}

variable "vpc" {
  default     = "vpc-09d2f111a7deaba61"
  description = "ID of the VPC for the instance"
  type        = string
}

variable "sg" {
  default     = "sg-0d9ffb2593748c945"
  description = "ID of the security group for the instance"
  type        = string
}

variable "subnet_id" {
  default     = "subnet-0e01da0e7377e6f4b"
  description = "ID of the subnet where the instance will be deployed"
  type        = string
}

variable "subnet_id2" {
  default     = "subnet-04cb2e2531536982c"
  description = "ID of the secondary subnet where the instance will be deployed"
  type        = string
}


variable "ami" {
  default     = "ami-09c59b011574e4c96"
  description = "AMI ID for the EC2 instance"
  type        = string
}
