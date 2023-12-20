

variable "student_name" {
  description = "Name of the student learning Terraform"
  type        = string
  default     = "oscar-fragozo"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24", "10.10.5.0/24"]
}

variable "ssh_key" {
  description = "Provides custom public ssh key"
}

variable "my_ip" {
  description = "my public ip address"
  type        = string
  default     = "190.67.247.186"
}