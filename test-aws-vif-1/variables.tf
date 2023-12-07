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

variable "f5xc_aws_cred" {
  type = string
}

variable aws_vif {
  type = map(map(string))
  default = {
    primary = {
      connection_id        = "",
      region      = "",
      description = "",
      vlan = "",
      bgp_asn =  "",
      custom_asn = 64555,
      router_peer_address = "",
      aws_router_peer_address = "",
      auth_key = ""
    }
  }
}

variable "private_adn_network_name" {
  type = string
  default = ""
}
