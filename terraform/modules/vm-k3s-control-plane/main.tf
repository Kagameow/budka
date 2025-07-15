resource "proxmox_virtual_environment_vm" "k3s_control_plane" {
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
        import_from = var.vm_cloud_image_id
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
    connection {
        type = "ssh"
        user = var.ssh_user
        private_key = var.ssh_private_key
        timeout = "5m"
        host = var.ipv4_address
    }
    provisioner "remote-exec" {
      
    }
}

