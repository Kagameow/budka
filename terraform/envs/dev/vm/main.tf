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

module "vm_cloud_image" {
  source           = "../../../modules/download_vm_image"
  node_name        = "budka"
  cloud_image_name = "noble-cloudimg-amd64-v2"
  cloud_image_url  = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  content_type     = "import"
}

module "ubuntu_vm" {
  depends_on = [module.vm_cloud_image]

  source         = "../../../modules/vm"
  vm_name        = "ubuntu-vm-test"
  node_name      = "budka"
  agent_enabled  = true
  cores          = 2
  memory_size    = 2048
  datastore_id   = "local-lvm"
  disk_size      = 20
  disk_discard   = "on"
  iothread       = true
  interface      = "scsi0"
  ipv4_address   = "192.168.2.240/24"
  ipv4_gateway   = "192.168.2.254"
  network_bridge = "vmbr0"

  user_data_file_id = "local:snippets/user-data-cloud-config.yaml"
  vm_cloud_image_id = module.vm_cloud_image.image_id
}
