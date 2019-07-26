resource "digitalocean_droplet" "recondroid" {
  name   = "recondroid"
  size   = "4gb"
  image  = "debian-9-x64"
  region = "sfo2"
}
