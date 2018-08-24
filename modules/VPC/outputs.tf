output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "route_table_id" {
  value = "${aws_route_table.default.id}"
}
