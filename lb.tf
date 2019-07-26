resource "digitalocean_loadbalancer" "public" {
  name   = "recondroid-pub"
  region = "sfo2"

  forwarding_rule {
    entry_port     = 22
    entry_protocol = "tcp"

    target_port     = 22
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]
}
