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
  endpoint  = var.ve_endpoint
  insecure  = true
  api_token = var.api_token
  ssh {
    agent    = true
    username = "terraform"
  }
}



module "ubuntu_vm" {
    source = "../../../modules/vm"
    vm_name = "ubuntu_vm_test"
    node_name = "pve"
    agent_enabled = true
    cores = 2 
    memory_size = 2048
    datastore_id = "local"
    disk_size = 20
    disk_discard = true
    iothread = true
    interface = "scsi0"
    ubuntu_cloud_image_name = "noble"
    ipv4_address = "10.20.30.0/24"
    ipv4_gateway = "192.168.2.254"
    network_bridge = "vmbr0"

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    import_from = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
}
