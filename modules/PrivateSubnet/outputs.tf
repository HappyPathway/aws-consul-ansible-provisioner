output "subnet_id" {
  value = "${aws_subnet.subnet.id}"
}

output "subnet_cidr" {
  value = "${var.subnet_cidr}"
}

output "admin_sg" {
  value = "${aws_security_group.admin.id}"
}
