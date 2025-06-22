terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://proxmoxhost/api2/json"
  pm_api_token_id          = "terraform@pam!terraform"
  pm_api_token_secret    = ""
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "vm-instance" {
  name        = "vm-instance"
  target_node = "budka"
  clone       = "ubuntu-cloud"
  full_clone  = true
  cores       = 2
  memory      = 4096

  disk {
    size    = "20G"
    type    = "disk"
    storage = "local-lvm"
    discard = true
    slot    = "scsi0"
  }

  network {
    id       = 0
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
  }
}
