variable "role_name" {
  description = "Name of the IAM role for session_manager"
  type        = string
  default     = "session_manager"
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile for EC2"
  type        = string
}
