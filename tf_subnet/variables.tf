variable "vpc_id" { }
variable "cidr" { }
variable "az" { }
variable "name" { default = "public-sn"}
variable "map_public_ip_on_launch" { default ="true"}