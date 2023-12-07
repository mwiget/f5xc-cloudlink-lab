locals {
  cwd        = split("/", path.cwd)
  testengine = element(local.cwd, length(local.cwd) - 2)
  testcase   = basename(abspath(path.cwd))
  connection = {
    "metadata": {
      "name": format("%s-%s", var.project_prefix, local.testcase),
      "description": format("generated by %s", local.testengine),
      "disable": false
    },
    "spec": {
      "gcp": {
        "gcp_cred": {
          "namespace": "system",
          "name": var.f5xc_gcp_cred
          "kind": "cloud_credentials"
        },
        "byoc": {
          "connections": [
          for name, connection in var.gcp_interconnect: {
              "metadata": {
                "name": "${name}",
                "description": connection.description
                "disable": false
              },
              "region": connection.region,
              "same_as_credential": {},
              "interconnect_attachment_name": connection.name
            }
          ]
        }
      },
      "enabled": {
        "cloudlink_network_name": var.private_adn_network_name
      },
      #      "disabled": {}
    }
  }
}

resource "restapi_object" "cloudlink-gcp" {
  id_attribute = "metadata/name"
  path         = "/config/namespaces/system/cloud_links"
  data         = jsonencode(local.connection)
}

output "connection" {
  value = local.connection
}

output "cloudlink-gcp" {
  value = restapi_object.cloudlink-gcp[*]
}

