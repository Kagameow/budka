terraform {
  required_version = ">= 1.12.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.2"
    }
  }
}


provider "proxmox" {
  endpoint  = var.ve_endpoint
  insecure  = true
  api_token = var.api_token
  ssh {
    agent    = true
    username = "terraform"
  }
}

module "subnet_bridge" {
  source = "../../../modules/subnet"

  name       = "doggo"
  node_name  = "budka"
  address    = "10.0.1.1/24"
  comment    = "Test cluster bridge"
  vlan_aware = true
}


