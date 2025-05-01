# ✅ Correct (outputs.tf should ONLY reference existing resources)
output "security_group_id" {
  description = "ID of the created Security Group"
  value       = aws_security_group.my_sg.id
}

output "nacl_id" {
  description = "ID of the created Network ACL"
  value       = aws_network_acl.my_nacl.id
}

#output "vpc_id" {
 # description = "The ID of the created VPC"
  #value       = aws_vpc.main.id  # Assuming your VPC resource is named 'main'
#}

output "vpc_id" {
  value = var.vpc_id
}



