output "bastion_host" {
  value = "${aws_instance.bastion.public_ip}"
}

output "bastion_sec_group" {
  value = "${aws_security_group.bastion.id}"
}
