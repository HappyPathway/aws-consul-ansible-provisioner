variable "vpc_name" {
  default = "terraform-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "route_table_name" {
  default = "terraform-route-table"
}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable "cluster_name" {}
