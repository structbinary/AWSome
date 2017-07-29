
variable "name" {
  default     = "awsome"
  description = "hackathone vpc"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = "false"
}

variable "enable_dns_support" {
  default = "false"
}
