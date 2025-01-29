terraform {
  backend "s3" {
    bucket = "raph-terraform-statefile"
    key = "server_name/statefile"
    region = "ap-south-1"
  }
}  
