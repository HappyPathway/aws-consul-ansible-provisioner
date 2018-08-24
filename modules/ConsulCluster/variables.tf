variable "ssh_access" {
  default = "0.0.0.0/0"
}

variable "key_name" {}

variable "private_subnet_id" {}

variable "vpc_id" {}

variable "consul_cluster_size" {
  default = 3
}

variable "instance_type" {
  default = "m4.large"
}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable "cluster_name" {}

variable "admin_sg" {}
