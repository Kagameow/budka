resource "proxmox_virtual_environment_download_file" "vm_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name    = var.node_name
  url          = var.cloud_image_url
  file_name = "${var.cloud_image_name}.qcow2"
}