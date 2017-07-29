variable "name" {}

variable "asg_max" {
  default = "5"
}

variable "asg_min" {
  default = "2"
}

variable "asg_desired" {
  default = "2"
}

variable "aws_az" {}

variable "subnets" {
  default = ""
}

variable "aws_amis" {
 default = {
    ap-south-1     = "ami-95cda6fa"
    ap-southeast-1 = "ami-2378f540"
    eu-west-1      = "ami-0f556569"
  
}

variable "aws_region" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair_id" {}

variable "bootstrap_script_path" {
  default = "awsome_bootstrap.tpl"
}

