resource "random_id" "sec_group" {
  byte_length = 24

  keepers = {
    # Generate a new id each time we switch to a new AMI id
    sc_group = "${aws_security_group.consul.id}"
  }
}

resource "aws_instance" "consul" {
  count         = "${var.consul_cluster_size}"
  ami           = "${data.aws_ami.consul_ami.id}"
  instance_type = "${var.instance_type}"

  subnet_id = "${var.private_subnet_id}"
  key_name  = "${var.key_name}"
  tags      = "${merge(map("cluster_id", "${random_id.sec_group.hex}", "cluster_name", "${var.cluster_name}"), var.resource_tags)}"

  security_groups = [
    "${aws_security_group.consul.id}",
    "${var.admin_sg}",
    "${aws_security_group.consul_client.id}",
  ]
}
