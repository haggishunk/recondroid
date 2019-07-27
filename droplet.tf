resource "digitalocean_droplet" "recondroid" {
  name               = "recondroid"
  size               = "4gb"
  image              = "debian-9-x64"
  region             = "sfo2"
  private_networking = true
  ssh_keys           = ["${var.ssh_key}"]
  tags               = ["ci", "drone"]
  user_data          = <<-EOF
    #!/bin/bash

    apt update
    apt install -y curl
    curl -sSL https://get.docker.com | sh -

    useradd -m recondroid
    usermod -aG docker recondroid
    mkdir /home/recondroid/.ssh
    cp /root/.ssh/authorized_keys /home/recondroid/.ssh/authorized_keys
    chown -R recondroid:recondroid /home/recondroid/.ssh
    EOF
}
