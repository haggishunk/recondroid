resource "digitalocean_droplet" "recondroid" {
  name               = "recondroid"
  size               = "4gb"
  image              = "debian-9-x64"
  region             = "sfo2"
  private_networking = true
  monitoring         = true
  ssh_keys           = ["${var.ssh_key}"]
  tags               = ["ci", "drone"]
  user_data          = "${data.template_cloudinit_config.config.rendered}"
}
