provider "aws" {
  access_key = "xxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxx"
  region     = "ap-southeast-1"
}

module "awsome_vpc" {
  source = "../tf_vpc"
  name = "awsome"
  cidr = "10.0.0.0/16"
}

module "awsome_vpc_public_sn" {
  source = "../tf_subnet"
  vpc_id = "${module.awsome_vpc.id}"
  name = "awsome-public-sn"
  cidr = "10.0.0.0/24"
  az = "ap-southeast-1a"
  map_public_ip_on_launch = "true"
}

module "awsome_private_route_table" {
  source = "../tf_pvt_rt"
  vpc_name = "${module.awsome_vpc.name}"
  vpc_id = "${module.awsome_vpc.id}"
  pub_sn_id = "${module.awsome_vpc_public_sn.id}"
}

module "awsome_vpc_private_sn" {
  source = "../tf_private_subnet"
  vpc_id = "${module.awsome_vpc.id}"
  name = "awsome-private-sn"
  cidr = "10.0.1.0/24"
  az = "ap-southeast-1b"
  pvt_route_table_id = "${module.awsome_private_route_table.route_table_id}"
}

module "awsome_web_sg" {
  source = "../tf_web_sg"
  vpc_id = "${module.awsome_vpc.id}"
  allowed_cidr = "0.0.0.0/0"
}

module "awsome_key_pair" {
  source = "../tf_key_pair"
  name = "awsome_key"
  public_key_path = "/home/rajiv/.ssh/id_rsa.pub"
}