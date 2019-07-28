resource "digitalocean_firewall" "ssh" {
  name = "ssh-only"

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }
}

resource "digitalocean_firewall" "dns" {
  name = "dns"

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0"]
  }
}

resource "digitalocean_firewall" "web-out" {
  name = "web-outbound"

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0"]
  }
}

resource "digitalocean_firewall" "web-in" {
  name = "web-inbound"

  droplet_ids = ["${digitalocean_droplet.recondroid.id}"]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0"]
  }
}
