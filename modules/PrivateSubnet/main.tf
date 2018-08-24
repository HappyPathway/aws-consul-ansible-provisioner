resource "aws_subnet" "subnet" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnet_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "${var.availability_zone}"
  tags                    = "${merge(map("Name", "${var.subnet_name}"), var.resource_tags)}"
}
