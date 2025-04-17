

# EC2 instance in Public Subnet 1
resource "aws_instance" "public_subnet_1" {
  ami           = "ami-00a929b66ed6e0de6"  # Replace with your AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_1_id  # Referencing the subnet ID variable
  associate_public_ip_address = true  # Ensures that the instance gets a public IP


  tags = {
    Name        = "ec2-public-subnet-1"
    Environment = "production"
    Project     = "Fail-over_Infrastructure"
  }
}

# EC2 instance in Public Subnet 2
resource "aws_instance" "public_subnet_2" {
  ami           = "ami-00a929b66ed6e0de6"  # Replace with your AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_2_id  # Referencing the subnet ID variable
  associate_public_ip_address = true  # Ensures that the instance gets a public IP


  tags = {
    Name        = "ec2-public-subnet-2"
    Environment = "production"
    Project     = "Fail-over_Infrastructure"
  }
}

# EC2 instance in Private Subnet 1
resource "aws_instance" "private_subnet_1" {
  ami           = "ami-00a929b66ed6e0de6"  # Replace with your AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_1_id  # Referencing the subnet ID variable

  tags = {
    Name        = "ec2-private-subnet-1"
    Environment = "production"
    Project     = "Fail-over_Infrastructure"
  }
}

# EC2 instance in Private Subnet 2
resource "aws_instance" "private_subnet_2" {
  ami           = "ami-00a929b66ed6e0de6"  # Replace with your AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_2_id  # Referencing the subnet ID variable

  tags = {
    Name        = "ec2-private-subnet-2"
    Environment = "production"
    Project     = "Fail-over_Infrastructure"
  }
}
