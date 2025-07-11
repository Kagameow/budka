terraform {
  required_version = ">= 1.12.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.79.0"
    }
  }
}


provider "proxmox" {
  endpoint  = "https://${var.ve_endpoint_ip}:8006"
  password = var.ve_password
  insecure  = true
  username = "${var.user_name}@pam"
  # api_token = var.api_token
  ssh {
    agent    = true
    username = var.user_name

    node {
      name = var.node_name
      address = var.ve_endpoint_ip
    }
  }
}



module "ubuntu_vm" {
    source = "../../../modules/cloud_init_config"
    ssh_public_key_path = "/home/pes/.ssh/id_ed25519.pub"
    cloud_init_config_name = "user-data-cloud-config"
    node_name = "budka"
    user_name = "ubuntu"
}
