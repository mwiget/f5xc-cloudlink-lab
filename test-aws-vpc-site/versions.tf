terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = "1.18.2"
    }
    volterra = {
      source = "volterraedge/volterra"
      version = ">= 0.11.28"
    }
  }
}

