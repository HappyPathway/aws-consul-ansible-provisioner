variable "route_table_id" {}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_name" {}
variable "vpc_id" {}

variable "public_ip" {
  default = true
}

variable "availability_zone" {}

variable "resource_tags" {
  description = "Optional map of tags to set on resources, defaults to empty map."
  type        = "map"
  default     = {}
}

variable "cluster_name" {}
