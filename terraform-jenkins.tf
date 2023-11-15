provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "Group2_Week_Project" {
  ami                         = "ami-0c5bf7ca464563eac"
  instance_type               = "t3.large"
  iam_instance_profile        = "ssm_role"
  associate_public_ip_address = true
  subnet_id                   = subnet-03210d19e1df800ef
  security_groups             = [sg-097d4e8ac9e82c5c7]
  root_block_device {
    volume_size = 30
  }
  tags = {
    Name = "Group2_web1"
  }
  lifecycle {
    create_before_destroy = true
  }
}
