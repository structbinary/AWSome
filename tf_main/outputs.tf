output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "default_sg_id" {
  value = "${aws_vpc.vpc.default_security_group_id}"
}