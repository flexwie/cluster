data "hcloud_ssh_key" "macbook" {
  name = "Macbook"
}

resource "tailscale_tailnet_key" "join_key" {
  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = 3600
  description   = "Terraform Key"

  tags = ["tag:terraform"]
}

resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "debian-11"
  server_type = "cax11"
  location    = "nbg1"

  public_net {
    ipv4_enabled = true
  }

  shutdown_before_deletion = true

  ssh_keys  = [data.hcloud_ssh_key.macbook.id]
  user_data = templatefile("cloud-init.tftpl", { authkey = tailscale_tailnet_key.join_key.key, tailscale_client_id = var.tailscale_client_id, tailscale_client_secret = var.tailscale_client_secret })
}
