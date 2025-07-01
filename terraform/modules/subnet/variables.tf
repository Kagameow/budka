variable "name" {
  description = "Name of the subnet bridge"
  type        = string
}

variable "node_name" {
  description = "Name of the Proxmox node"
  type        = string
}

variable "address" {
  description = "IP address of the subnet bridge"
  type        = string
  default     = ""
}

variable "comment" {
  description = "Comment for the subnet bridge"
  type        = string
  default     = ""
}

variable "vlan_aware" {
  description = "Enable VLAN awareness for the subnet bridge"
  type        = bool
  default     = false
}