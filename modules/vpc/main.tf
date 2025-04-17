# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "Ladi-vpc"
    Project     = "Fail-over_Infrastructure"
  }
}

# Public Subnet 1
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[0]
  map_public_ip_on_launch = true
  availability_zone       = var.azs[0]

  tags = {
    Name        = "public-subnet-1"
    Environment = "production"
    Type        = "public"
  }
}

# Route Table for Public Subnet 1
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "public-route-table-1"
    Environment = "production"
  }
}

# Associate Public Subnet 1 with Route Table
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

# Public Subnet 2
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[1]
  map_public_ip_on_launch = true
  availability_zone       = var.azs[1]

  tags = {
    Name        = "public-subnet-2"
    Environment = "production"
    Type        = "public"
  }
}

# Route Table for Public Subnet 2
resource "aws_route_table" "public_2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "public-route-table-2"
    Environment = "production"
  }
}

# Associate Public Subnet 2 with Route Table
resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_2.id
}

# Private Subnet 1
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[0]
  availability_zone = var.azs[0]

  tags = {
    Name        = "private-subnet-1"
    Environment = "production"
    Type        = "private"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[1]
  availability_zone = var.azs[1]

  tags = {
    Name        = "private-subnet-2"
    Environment = "production"
    Type        = "private"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# Elastic IP for NAT Gateway 1
resource "aws_eip" "nat_1" {
  domain = "vpc"

  tags = {
    Name = "Elastic-IP-Nat"
  }
}

# Elastic IP for NAT Gateway 2
resource "aws_eip" "nat_2" {
  domain = "vpc"

  tags = {
    Name = "Elastic-IP-Nat-2"
  }
}

# NAT Gateway 1
resource "aws_nat_gateway" "main_1" {
  subnet_id     = aws_subnet.public_1.id
  allocation_id = aws_eip.nat_1.id 

  tags = {
    Name = "nat-gateway-1"
  }
}

# NAT Gateway 2
resource "aws_nat_gateway" "main_2" {
  subnet_id     = aws_subnet.public_2.id
  allocation_id = aws_eip.nat_2.id 

  tags = {
    Name = "nat-gateway-2"
  }
}

# Route Table for Private Subnet 1
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_1.id 
  }

  tags = {
    Name        = "private-route-table-1"
    Environment = "production"
  }
}

# Associate Private Subnet 1 with Route Table
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

# Route Table for Private Subnet 2
resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_2.id 
  }

  tags = {
    Name        = "private-route-table-2"
    Environment = "production"
  }
}

# Associate Private Subnet 2 with Route Table
resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2.id
}

