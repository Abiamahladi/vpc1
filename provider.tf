provider "aws" {
  region  = "us-east-1" # or use var.aws_region if you defined it in variables.tf
  profile = "default"   # This uses the 'abiam' profile you configured
}

