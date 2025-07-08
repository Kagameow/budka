resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
    name = var.vm_name
    node_name = var.node_name

    agent {
        enabled = var.agent_enabled
    }
    cpu {
        cores = var.cores
    }
    memory {
        dedicated = var.memory_size
    }

    disk {
        datastore_id = var.datastore_id
        size = var.disk_size
        discard = var.disk_discard
        iothread = var.iothread
        interface = var.interface
        import_from = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    }

    initialization {
      ip_config {
        ipv4 {
          address = var.ipv4_address
          gateway = var.ipv4_gateway
        }
      }
      user_data_file_id = var.user_data_file_id
    }
    network_device {
        bridge = var.network_bridge
    }
}


resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name    = "pve"
  url          = "https://cloud-images.ubuntu.com/${var.ubuntu_cloud_image_name}/current/${var.ubuntu_cloud_image_name}-server-cloudimg-amd64.img"
  file_name = "${var.ubuntu_cloud_image_name}-server-cloudimg-amd64.qcow2"
}