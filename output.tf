output "droplet_ip" {
  value = "${digitalocean_droplet.recondroid.ipv4_address}"
}
