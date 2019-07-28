resource "digitalocean_loadbalancer" "public" {
  name   = "recondroid-pub"
  region = "sfo2"

  forwarding_rule {
    entry_port     = 22
    entry_protocol = "tcp"

    target_port     = 22
    target_protocol = "tcp"
  }
  
  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 443
    target_protocol = "https"

    tls_passthrough = true
  }

  redirect_http_to_https = true

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]
}
