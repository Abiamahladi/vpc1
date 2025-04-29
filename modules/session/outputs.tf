output "instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.this.name
}

output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.this.name
}