# Variable for Public Subnet 1 ID
variable "public_subnet_1_id" {
  description = "The ID of Public Subnet 1"
  type        = string
}

# Variable for Public Subnet 2 ID
variable "public_subnet_2_id" {
  description = "The ID of Public Subnet 2"
  type        = string
}

# Variable for Private Subnet 1 ID
variable "private_subnet_1_id" {
  description = "The ID of Private Subnet 1"
  type        = string
}

# Variable for Private Subnet 2 ID
variable "private_subnet_2_id" {
  description = "The ID of Private Subnet 2"
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to attach to the EC2 instances"
  type        = string
  default     = null  # Optional: Set a default if needed
}

variable "ec2_instance_profile_name" {
  description = "Name of the IAM instance profile to attach to EC2 instances"
  type        = string
  # default = "default-profile-name"  # (Optional) Uncomment if you want a fallback
}










