resource "aws_subnet" "subnet" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.cidr}"
  availability_zone = "${var.az}"

  tags {
    Name = "${var.name}"
  }

  map_public_ip_on_launch = "false"
}

resource "aws_route_table_association" "rtb_association" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${var.pvt_route_table_id}"
}