variable "project_prefix" {
  type = string
  default = "project"
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_api_ca_cert" {
  type = string
  default = ""
}

variable "f5xc_gcp_cred" {
  type = string
}

variable gcp_interconnect_vpc {
  type = string
}
variable gcp_interconnect_subnet {
  type = string
}

variable "private_adn_network_name" {
  type = string
  default = ""
}

variable "gcp_region" {
  type = string
  default = ""
}
variable "ssh_public_key" {
  type = string
  default = ""
}
