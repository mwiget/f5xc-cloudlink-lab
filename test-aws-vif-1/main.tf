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
      "aws": {
        "aws_cred": {
          "namespace": "system",
          "name": var.f5xc_aws_cred
          "kind": "cloud_credentials"
        },
        "byoc": {
          "connections": [
          for name, connection in var.aws_vif: {
              "connection_id": connection.connection_id,
              "virtual_interface_type": "PRIVATE",
              "vlan": connection.vlan,
              "bgp_asn": connection.bgp_asn,
              "ipv4": {
                "router_peer_address": connection.router_peer_address,
                "aws_router_peer_address": connection.aws_router_peer_address,
              },
              "auth_key": {
                "clear_secret_info": {
                  "url": format("string:///%s", base64encode(connection.auth_key))
                }
              },
              "tags": {},
              "jumbo_mtu": false,
              "enable_sitelink": false,
              "metadata": {
                "name": "${name}",
                "disable": false
              },
              "region": connection.region,
              "coordinates": {
                "latitude": 44,
                "longitude": -120.5
              }
            }
          ]
        },
        "custom_asn": 64555
      },
      "enabled": {
        "cloudlink_network_name": var.private_adn_network_name
      },
      #      "disabled": {}
    }
  }
}

resource "restapi_object" "cloudlink-aws" {
  id_attribute = "metadata/name"
  path         = "/config/namespaces/system/cloud_links"
  data         = jsonencode(local.connection)
}

output "connection" {
  value = local.connection
}

output "cloudlink-aws" {
  value = restapi_object.cloudlink-aws[*]
}

