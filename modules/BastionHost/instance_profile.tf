resource "aws_iam_instance_profile" "ansible_ec2" {
  name = "${var.cluster_name}-ec2-ro"
  role = "${aws_iam_role.ansible_ec2.name}"
}

resource "aws_iam_policy" "ansible_ec2" {
  name   = "${var.cluster_name}-ec2-ro"
  path   = "/"
  policy = "${file("${path.module}/policy.json")}"
}

resource "aws_iam_role_policy_attachment" "ansible_ec2" {
  role       = "${aws_iam_role.ansible_ec2.name}"
  policy_arn = "${aws_iam_policy.ansible_ec2.arn}"
}

resource "aws_iam_role" "ansible_ec2" {
  name = "${var.cluster_name}-ec2-ro"
  path = "/"

  assume_role_policy = "${file("${path.module}/role.json")}"
}
