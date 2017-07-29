
resource "aws_security_group" "pub_http_sg" {
  name   = "pub_web_sg"
  vpc_id = "${var.vpc_id}"

  # SSH access from anywhere
  ingress {
    from_port   = 2220
    to_port     = 2220
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr}"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}