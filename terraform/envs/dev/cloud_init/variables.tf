variable "api_token" {
  description = "API token for the Proxmox VE cluster"
  type        = string
  sensitive = true
  ephemeral = true
}

variable "ve_endpoint_ip" {
  description = "Proxmox VE API endpoint"
  type        = string
  default     = "172.168.0.1"
}

variable "ve_password" {
  description = "Password for the Proxmox VE API"
  type        = string
  sensitive   = true
  default     = "your_password_here"  
}

variable "node_name" {
  description = "Name of the Proxmox node where the cloud-init configuration will be applied"
  type        = string
  default     = "pve"
}

variable "user_name" {
  description = "Username for SSH access to the Proxmox node"
  type        = string
  default     = "root" 
}