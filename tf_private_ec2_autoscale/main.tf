data "template_file" "bootstrap" {
  template = "${file("${path.module}/${var.bootstrap_script_path}")}"

  vars {
    HOSTNAME              = "${var.name}"
}

resource "aws_autoscaling_group" "asg" {
  name                 = "${var.name}"
  vpc_zone_identifier  = ["${var.subnets}"]
  max_size             = "${var.asg_max}"
  min_size             = "${var.asg_min}"
  desired_capacity     = "${var.asg_desired}"
  force_delete         = true
  launch_configuration = "${aws_launch_configuration.lc.name}"

  tag {
    key                 = "Name"
    value               = "${var.name}_asg"
    propagate_at_launch = "true"
  }
}

resource "aws_launch_configuration" "lc" {
  name          = "${var.name}_lc"
  image_id      = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "${var.instance_type}"
  user_data     = "${data.template_file.bootstrap.rendered}"
  key_name      = "${var.key_pair_id}"
}