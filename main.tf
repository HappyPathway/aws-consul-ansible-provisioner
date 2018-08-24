provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_key_pair" "consul_keypair" {
  key_name   = "${var.key_name}"
  public_key = "${file("~/.ssh/${var.key_name}.pub")}"
}

module "vpc" {
  source        = "./modules/VPC"
  vpc_name      = "${var.cluster_name}"
  cluster_name  = "${var.cluster_name}"
  resource_tags = "${var.resource_tags}"
}

module "public_subnet" {
  source            = "./modules/PublicSubnet"
  subnet_name       = "${var.cluster_name}-public"
  vpc_id            = "${module.vpc.vpc_id}"
  route_table_id    = "${module.vpc.route_table_id}"
  availability_zone = "${var.aws_availability_zone}"
  subnet_cidr       = "${var.public_subnet_cidr}"
  cluster_name      = "${var.cluster_name}"
  resource_tags     = "${var.resource_tags}"
}

module "private_subnet" {
  source                           = "./modules/PrivateSubnet"
  subnet_name                      = "${var.cluster_name}-private"
  vpc_id                           = "${module.vpc.vpc_id}"
  public_subnet_id                 = "${module.public_subnet.subnet_id}"
  availability_zone                = "${var.aws_availability_zone}"
  subnet_cidr                      = "${var.private_subnet_cidr}"
  private_subnet_egress_cidr_block = "${var.private_subnet_egress_cidr_block}"
  cluster_name                     = "${var.cluster_name}"
  resource_tags                    = "${var.resource_tags}"
}

module "consul_cluster" {
  source            = "./modules/ConsulCluster"
  vpc_id            = "${module.vpc.vpc_id}"
  private_subnet_id = "${module.private_subnet.subnet_id}"
  instance_type     = "${var.consul_cluster_instance_type}"
  key_name          = "${aws_key_pair.consul_keypair.key_name}"
  cluster_name      = "${var.cluster_name}"
  resource_tags     = "${var.resource_tags}"
  admin_sg          = "${module.private_subnet.admin_sg}"
}

module "Bastion" {
  source           = "./modules/BastionHost"
  public_subnet_id = "${module.public_subnet.subnet_id}"
  vpc_id           = "${module.vpc.vpc_id}"
  ssh_access       = "${var.bastion_access_cidr}"
  key_name         = "${aws_key_pair.consul_keypair.key_name}"
  instance_type    = "${var.bastion_host_instance_type}"
  cluster_name     = "${var.cluster_name}"
  admin_sg         = "${module.private_subnet.admin_sg}"
}

module "ClusterConfig" {
  source           = "./modules/ClusterConfig"
  bastion_host     = "${module.Bastion.bastion_host}"
  target_sec_group = "${module.consul_cluster.consul_security_group}"
  src_sec_group    = "${module.Bastion.bastion_sec_group}"
  cluster_id       = "${module.consul_cluster.cluster_id}"
  cluster_name     = "${var.cluster_name}"
}
