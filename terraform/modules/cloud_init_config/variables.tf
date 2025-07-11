variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "cloud_init_config_name" {
  description = "Name of the cloud-init configuration file"
  type        = string
  default     = "user-data-cloud-config"
}

variable "node_name" {
  description = "Name of the Proxmox node where the cloud-init configuration will be applied"
  type        = string
  default     = "pve"
}

variable "user_name" {
  description = "Username for the cloud-init configuration"
  type        = string
  default     = "ubuntu"
}