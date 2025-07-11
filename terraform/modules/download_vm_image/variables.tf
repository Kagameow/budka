variable "cloud_image_name" {
  description = "Name of the cloud image to download"
  type        = string
}

variable "cloud_image_url" {
  description = "URL of the cloud image to download"
  type        = string
}

variable "node_name" {
  description = "Name of the Proxmox node where the image will be downloaded"
  type        = string
  default     = "pve"
}