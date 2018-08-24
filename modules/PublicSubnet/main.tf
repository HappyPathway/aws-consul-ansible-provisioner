resource "aws_subnet" "subnet" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnet_cidr}"
  map_public_ip_on_launch = "${var.public_ip}"
  availability_zone       = "${var.availability_zone}"
  tags                    = "${merge(map("Name", "${var.subnet_name}"), var.resource_tags)}"
}

resource "aws_route_table_association" "default" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${var.route_table_id}"
}
