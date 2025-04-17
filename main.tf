module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs

}


module "ec2" {
  source = "./module_EC2"


  public_subnet_1_id  = module.vpc.public_subnet_ids[0]
  public_subnet_2_id  = module.vpc.public_subnet_ids[1]
  private_subnet_1_id = module.vpc.private_subnet_ids[0]
  private_subnet_2_id = module.vpc.private_subnet_ids[1]
}


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