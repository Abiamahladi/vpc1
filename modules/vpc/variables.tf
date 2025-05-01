variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Enable VPN Gateway"
  type        = bool
  default     = false
}

#variable "vpc_id" {
 # type = string
#}









