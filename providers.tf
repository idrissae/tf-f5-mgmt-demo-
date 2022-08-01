


terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
      version = "1.14.0"
    }
  }

  backend "s3" {
    bucket = "remote-tf-state-files"
    key = "f5-vs"
    region = "us-east-1"
    
  }
}



provider "bigip" {
  address  = var.bigip_hostname
  username = var.admin_username
  password = var.admin_password
}