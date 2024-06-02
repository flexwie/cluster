terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }

    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.16.1"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "tailscale" {
  oauth_client_id     = var.tailscale_client_id
  oauth_client_secret = var.tailscale_client_secret
  scopes              = ["devices"]
}
