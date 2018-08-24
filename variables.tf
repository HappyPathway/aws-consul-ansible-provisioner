variable "aws_region" {
  default = "us-east-1"
}

variable "aws_availability_zone" {
  default = "us-east-1a"
}

variable "resource_tags" {
  type = "map"

  default = {
    role = "consul-cluster"
  }
}

variable "key_name" {
  default = "consul_cluster"
}

variable "cluster_name" {
  default = "consul-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "bastion_access_cidr" {
  default = "0.0.0.0/0"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "private_subnet_egress_cidr_block" {
  default = "0.0.0.0/0"
}

variable "bastion_host_instance_type" {
  default = "m4.large"
}

variable "consul_cluster_instance_type" {
  default = "m4.large"
}
