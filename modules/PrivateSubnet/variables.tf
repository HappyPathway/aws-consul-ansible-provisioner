variable "subnet_name" {}
variable "vpc_id" {}

variable "subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "public_subnet_id" {}

variable "availability_zone" {}

variable "private_subnet_egress_cidr_block" {
  default = "0.0.0.0/0"
}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable "cluster_name" {}
