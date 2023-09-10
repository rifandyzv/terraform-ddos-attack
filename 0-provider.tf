terraform {
  required_providers {
    alicloud = {
      source  = "hashicorp/alicloud"
      version = "1.209.1"
    }
  }
}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}



variable "vpc_name" {
  default = "autoscalling"
}

variable "target_ip" {
    default = "147.139.172.46"
}

locals {
  name   = "demotf"
  prefix = "tf"
  zone   = "ap-southeast-5a"
}