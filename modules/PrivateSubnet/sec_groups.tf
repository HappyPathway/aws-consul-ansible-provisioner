resource "aws_security_group" "admin" {
  name   = "${aws_subnet.subnet.id}-subnet-admin"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    self      = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = "${var.resource_tags}"
}
