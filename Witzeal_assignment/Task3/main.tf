provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                    = "witzeal_assignment"
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key
  monitoring              = true
  vpc_security_group_ids  = [var.sg]
  subnet_id               = var.subnet_id

  tags = {
    Name = "witzeal_assignment"
  }
}


output "instance_id" {
  value = module.ec2_instance.id
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}