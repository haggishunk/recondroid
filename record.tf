resource "digitalocean_record" "recondroid" {
  domain = "${var.domain}"
  type   = "A"
  name   = "www"
  value  = "${digitalocean_loadbalancer.public.ip}"
}
