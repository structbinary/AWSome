data "template_file" "bootstrap" {
  template = "${file("${path.module}/${var.bootstrap_script_path}")}"

}

# attaching ebs volume to ec2-instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "${var.volume_path}"
  volume_id   = "${aws_ebs_volume.volume.id}"
  instance_id = "${aws_instance.instance.id}"
}

resource "aws_instance" "instance" {
  ami                  = "${lookup(var.aws_ami_map, var.aws_region)}"
  count                = "${var.number_of_instances}"
  subnet_id            = "${var.subnet_id}"
  instance_type        = "${var.type}"
  user_data            = "${data.template_file.bootstrap.rendered}"
  key_name             = "${var.key_pair_id}"
  iam_instance_profile = "${var.iam_instance_profile}"
  availability_zone    = "${var.aws_zone_id}"

  tags {
    Name = "${var.name}"
  }
}

# creating 20 gb disk
resource "aws_ebs_volume" "volume" {
  availability_zone = "${var.aws_zone_id}"
  size              = "${var.ebs_volume_size}"

  tags {
    Name = "${var.name}"
  }
}