resource "digitalocean_firewall" "ssh" {
  name = "ssh-only"

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses =  ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses =  ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses =  ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses =  ["0.0.0.0/0"]
  }
}
