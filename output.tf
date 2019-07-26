output "domain_urn" {
  value = "${data.digitalocean_domain.personal.urn}"
}

output "droplet_ip" {
  value = "${digitalocean_droplet.recondroid.ipv4_address}"
}
