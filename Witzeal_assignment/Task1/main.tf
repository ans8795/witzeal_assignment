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

resource "null_resource" "remote-exec" {
  depends_on = [module.ec2_instance]

  provisioner "remote-exec" {
    inline = [
      "echo 'build ssh connection'"
    ]
    connection {
      host        = module.ec2_instance.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./my_aws_account.pem")
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${module.ec2_instance.public_ip}, --private-key my_aws_account.pem playbook.yaml"
  }
}

