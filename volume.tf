resource "digitalocean_volume" "data" {
  region                  = "sfo2"
  name                    = "${var.volume_name}"
  size                    = 100
  initial_filesystem_type = "ext4"
  description             = "drone stores data here"
}

resource "digitalocean_volume_attachment" "data" {
  droplet_id = "${digitalocean_droplet.recondroid.id}"
  volume_id  = "${digitalocean_volume.data.id}"
}
