#terraform {
 # backend "local" {
    #path = "terraform.tfstate"
 # }
#}


#terraform {
  #backend "s3" {
   # bucket       = "tfstate-storage-bucket-ladi" # Replace with the actual name of your bucket
   # key          = "env/dev/terraform.tfstate"
   # region       = "us-east-1"
    #encrypt      = true
    #use_lockfile = true
  #}
#}

terraform {
  # No backend config = local backend by default
}


