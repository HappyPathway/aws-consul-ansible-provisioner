variable "public_subnet_id" {}
variable "vpc_id" {}
variable "ssh_access" {}

variable "instance_type" {
  default = "m1.large"
}

variable "key_name" {}

variable "admin_sg" {}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable "cluster_name" {}
