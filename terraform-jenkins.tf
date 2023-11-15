provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "Group2_Week_Project" {
  ami                         = "ami-0c5bf7ca464563eac"
  instance_type               = "t3.large"
  iam_instance_profile        = "ssm_role"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.my_group_subnet.id
  security_groups             = [aws_security_group.Group2_week_Project_security_Group.id]
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

resource "aws_security_group" "Group2_week_Project_security_Group" {
  name        = "Team2 Security Group"
  description = "Team2 Security Group"
  vpc_id      = "vpc-04b6091923e283784"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["172.31.64.0/20"]
  }

  egress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["172.31.64.0/20"]
  }

  dynamic "ingress" {
    for_each = ["80", "443", "8080", "9000", "8081", "2376"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = ["53", "80", "443", "8080", "9997", "8081", "2376"]
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}
