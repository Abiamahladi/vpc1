variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "aws_region" {
  description = "Declear aws region"
  default     = "us-east-1"
  type        = string
}


variable "aws_profile" {
  default = "abiam" # Match the profile name you configured
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to attach to the EC2 instances"
  type        = string
  default     = null # Optional: Set a default if needed
}


variable "vpc_id"{
 
 description = "The ID of the VPC to use"
  type        = string
}

