data "template_file" "iam_role_content" {
  template = "${file("${path.module}/iam_role.tpl")}"
}

data "template_file" "iam_role_policy_content" {
  template = "${file("${path.module}/iam_role_policy.tpl")}"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name       = "${var.name}"
  roles      = ["${aws_iam_role.iam_role.name}"]
  depends_on = ["aws_iam_role.iam_role"]
}

resource "aws_iam_role" "iam_role" {
  name = "${var.name}_iam_role"
  path = "/"

  assume_role_policy = "${data.template_file.iam_role_content.rendered}"
}

resource "aws_iam_role_policy" "iam_role_policy" {
  name = "${var.name}_iam_role_policy"
  role = "${aws_iam_role.iam_role.id}"

  policy = "${data.template_file.iam_role_policy_content.rendered}"
}