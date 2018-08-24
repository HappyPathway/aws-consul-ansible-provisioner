output "consul_cluster_id" {
  value = "${module.consul_cluster.cluster_id}"
}

output "bastion_host" {
  value = "${module.Bastion.bastion_host}"
}

output "admin_sg" {
  value = "${module.private_subnet.admin_sg}"
}

output "consul_clients_sg" {
  value = "${module.consul_cluster.clients_sg}"
}

output "consul_cluster_private_ips" {
  value = "${module.consul_cluster.hosts}"
}

output "consul_cluster_vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "jumphost_ssh_connection_strings" {
  # ssh-add private_key.pem && ssh -A -i private_key.pem ubuntu@<bastion_host>
  value = "ssh-add ${var.key_name} && ssh -A -i ${var.key_name} ubuntu@${module.Bastion.bastion_host}"
}
