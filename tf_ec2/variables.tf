variable "name" {}

variable "type" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "number_of_instances" {
  default = 1
}

variable "key_pair_id" {
  default = ""
}

variable "security_group" {
    default = ""
}

variable "bootstrap_script_path" {
  default = "bootstrap.tpl"
}


variable "iam_instance_profile" {
  default = ""
}

variable "aws_ami_map" {
  type = "map"

  default = {
    ap-south-1     = "ami-95cda6fa"
    ap-southeast-1 = "ami-2378f540"
    eu-west-1      = "ami-0f556569"
  }
}

variable "aws_region" {}

variable "aws_zone_id" {
  default = "ap-southeast-1a"
}

variable "volume_path" {
  default = "/dev/xvdb"
}

variable "volume_termination" {
  default = "true"
}

variable "ebs_volume_size" {
  default = 25
}
