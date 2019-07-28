data "digitalocean_domain" "personal" {
  name = "${var.domain}"
}

data "template_file" "script" {
  template                     = "${file("${path.module}/template/drone.sh.tpl")}"
  vars                         = {
    DRONE_DATA_VOLUME          = "${var.volume_name}"
    DRONE_GITHUB_CLIENT_ID     = "${var.github_client_id}"
    DRONE_GITHUB_CLIENT_SECRET = "${var.github_client_secret}"
    DRONE_SERVER_HOST          = local.drone_server_host
    DRONE_RPC_SECRET           = "${var.rpc_server_secret}"
    DRONE_RUNNER_CAPACITY      = 2
    DRONE_LOGS_DEBUG           = "${var.debug}"
  }
}

data "template_cloudinit_config" "config" {
  # digital ocean does not like gzipped or encoded data
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      =  "${data.template_file.script.rendered}"
  }
}
