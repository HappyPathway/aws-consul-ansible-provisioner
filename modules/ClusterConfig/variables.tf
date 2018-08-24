variable "bastion_host" {}

variable "bastion_user" {
  default = "ubuntu"
}

variable "src_sec_group" {}

variable "target_sec_group" {}

variable "cluster_id" {}

variable "consul_version" {
  default = "1.0.7"
}

variable "consul_connect" {
  default = false
}

variable "cluster_name" {}
