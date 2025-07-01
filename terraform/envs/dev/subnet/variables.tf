variable "api_token" {
  description = "API token for the Proxmox VE cluster"
  type        = string
  sensitive = true
  ephemeral = true
  
}

variable "ve_endpoint" {
  description = "Proxmox VE API endpoint"
  type        = string
  default     = "https://172.168.0.1:8006"
  
}