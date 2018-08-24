resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags       = "${merge(map("Name", "${var.vpc_name}"), var.resource_tags)}"
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags   = "${merge(map("Name", "${var.vpc_name}"), var.resource_tags)}"
}

resource "aws_route_table" "default" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags = "${merge(map("Name", "${var.vpc_name}"), var.resource_tags)}"
}
