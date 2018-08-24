output "consul_security_group" {
  value = "${aws_security_group.consul.id}"
}

output "cluster_id" {
  value = "${random_id.sec_group.hex}"
}

output "clients_sg" {
  value = "${aws_security_group.consul_client.id}"
}

output "hosts" {
  value = "${aws_instance.consul.*.private_ip}"
}
