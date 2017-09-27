variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret access key"
}

variable "region" { 
  description = "AWS region to host your network"
  default     = "us-west-2" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

/* Ubuntu 16.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-2 = "ami-6e1a0117" 
    us-east-1 = "ami-cd0f5cb6"
  }
}

variable "tag_prefix" { 
  description = "Default Tag prefix"
  default = "NGN-BIBF-Ansible-DEMO"
}