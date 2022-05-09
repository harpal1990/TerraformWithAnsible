variable "ports" {
  type = list(number)
}

variable "availabilityZone" {
  default = "us-east-1a"
}

variable "instanceTenancy" {
  default = "default"
}
variable "dnsSupport" {
  default = true
}
variable "dnsHostNames" {
  default = true
}

variable "vpcCIDRblock" {
  default = "172.16.0.0/16"
}
variable "PubsubnetCIDRblock" {
  default = "172.16.1.0/24"
}

variable "PvtsubnetCIDRblock" {
  default = "172.16.2.0/24"
}
variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
variable "egressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
variable "mapPublicIP" {
  default = true
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}
