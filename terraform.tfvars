vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24",

]

private_subnets = [
  "10.0.101.0/24",
  "10.0.102.0/24",

]

azs = [
  "us-east-1a",
  "us-east-1b",
]

aws_region = "us-east-1"

# terraform.tfvars
vpc_id = "module.vpc.vpc_id"  # Forces Terraform to use the module output


