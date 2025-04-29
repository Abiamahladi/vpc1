resource "aws_instance" "public_subnet_1" {
  ami                         = "ami-00a929b66ed6e0de6"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  iam_instance_profile        = var.ec2_instance_profile_name

  tags = {
    Name        = "ec2-public-subnet-1"
    Environment = "Staging"
    Project     = "Fail-over_Infrastructure"
  }
}

resource "aws_instance" "public_subnet_2" {
  ami                         = "ami-00a929b66ed6e0de6"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  iam_instance_profile        = var.ec2_instance_profile_name

  tags = {
    Name        = "ec2-public-subnet-2"
    Environment = "production"
    Project     = "Fail-over_Infrastructure"
  }
  }

  resource "aws_instance" "private_subnet_1" {
  ami                         = "ami-00a929b66ed6e0de6"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  iam_instance_profile        = var.ec2_instance_profile_name

  tags = {
    Name        = "ec2-private-subnet-1"
    Environment = "Staging"
    Project     = "Fail-over_Infrastructure"
  }
  }

  
  resource "aws_instance" "private_2_subnet_2" {
  ami                         = "ami-00a929b66ed6e0de6"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  iam_instance_profile        = var.ec2_instance_profile_name

  tags = {
    Name        = "ec2-private-subnet-2"
    Environment = "Product"
    Project     = "Fail-over_Infrastructure"
  }
  }

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "ec2_ssm_profile"

  role = aws_iam_role.ec2_ssm_role.name
}

resource "aws_iam_role" "ec2_ssm_role" {
  name               = "ec2_ssm_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
