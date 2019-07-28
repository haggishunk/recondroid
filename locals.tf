locals {
  drone_server_host = "drone.${var.domain}"
  drone_server_url  = "https://${local.drone_server_host}"
}
