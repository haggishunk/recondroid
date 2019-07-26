resource "digitalocean_project" "droneci" {
  name        = "recondroid"
  description = "Class project / Educational purposes / playing with drone"
  purpose     = "Continuous Integration"
  environment = "Development"
  resources   = [
    "${digitalocean_droplet.recondroid.urn}
  ]
}
