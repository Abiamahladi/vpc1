module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs

}

module "session" {
  source = "./modules/session"
  
  # REQUIRED parameters (check modules/session/variables.tf)
  iam_instance_profile_name = "ec2-ssm-profile"  # Add this line
  role_name = "EC2-ssm-role"
}

module "ec2" {
  source = "./modules/EC2"

  # Reference the VPC module outputs
  public_subnet_1_id  = module.vpc.public_subnet_ids[0]
  public_subnet_2_id  = module.vpc.public_subnet_ids[1]
  private_subnet_1_id = module.vpc.private_subnet_ids[0]
  private_subnet_2_id = module.vpc.private_subnet_ids[1]

  # Correctly reference the Session Manager module output
  ec2_instance_profile_name = module.session.instance_profile_name
  role_name = "EC2-ssm-role"
}















# EC2 Instances and other resources can go here



# Create the S3 bucket for Terraform state
#resource "aws_s3_bucket" "terraform_state" {
 # bucket = "tfstate-storage-bucket-ladi" # Must be globally unique

  # Prevent accidental deletion
 # lifecycle {
#    prevent_destroy = true
 # }
#}

#resource "aws_s3_bucket_versioning" "terraform_state" {
 # bucket = aws_s3_bucket.terraform_state.id
  #versioning_configuration {

   # status = "Enabled"
  #}
#}

#resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
 # bucket = aws_s3_bucket.terraform_state.id
  #rule {
   # apply_server_side_encryption_by_default {
     # sse_algorithm = "AES256"
   # }
 # }
#}