resource "proxmox_virtual_environment_network_linux_bridge" "subnet_bridge" {

  name = var.name
  node_name = var.node_name

  address = var.address
  vlan_aware = var.vlan_aware
  comment = "${var.comment} - deployed by Budka" 

}


