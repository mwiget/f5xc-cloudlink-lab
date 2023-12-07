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

variable gcp_interconnect {
  type = map(map(string))
  default = {
    primary = {
      name        = "",
      region      = ""
      description = ""
    }
  }
}

variable "private_adn_network_name" {
  type = string
  default = ""
}
