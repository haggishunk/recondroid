resource "digitalocean_record" "recondroid" {
  domain = "${var.domain}"
  type   = "A"
  name   = "drone"
  value  = "${digitalocean_loadbalancer.public.ip}"
}
