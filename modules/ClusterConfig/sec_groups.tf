resource "aws_security_group_rule" "consul_client" {
  security_group_id        = "${var.target_sec_group}"
  type                     = "ingress"
  from_port                = 8300
  to_port                  = 8302
  protocol                 = "tcp"
  source_security_group_id = "${var.src_sec_group}"
}

resource "aws_security_group_rule" "consul_8500" {
  security_group_id        = "${var.target_sec_group}"
  type                     = "ingress"
  from_port                = 8500
  to_port                  = 8500
  protocol                 = "tcp"
  source_security_group_id = "${var.src_sec_group}"
}

resource "aws_security_group_rule" "consul_8600" {
  security_group_id        = "${var.target_sec_group}"
  type                     = "ingress"
  from_port                = 8600
  to_port                  = 8600
  protocol                 = "tcp"
  source_security_group_id = "${var.src_sec_group}"
}
