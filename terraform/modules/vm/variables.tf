variable "ssh_key_name" {
  description = "Name of the SSH key to use for the VM."
  type        = string
  default     = "ssh_key"
}
variable "vm_name" {
    description = "Name of the virtual machine"
    type        = string
}

variable "node_name" {
    description = "Name of the Proxmox node"
    type        = string
}

variable "agent_enabled" {
    description = "Whether to enable the QEMU guest agent"
    type        = bool
    default     = true
}


variable "cores" {
    description = "Number of CPU cores"
    type        = number
    default     = 2
}

variable "memory_size" {
    description = "Amount of memory in MB"
    type        = number
    default     = 2048
}

variable "datastore_id" {
    description = "ID of the datastore to use"
    type        = string
}

variable "disk_size" {
    description = "Size of the disk in GB"
    type        = number
    default     = 20
}

variable "disk_discard" {
    description = "Whether to discard unused blocks"
    type        = bool
    default     = true
}

variable "iothread" {
    description = "Whether to use IO threads"
    type        = bool
    default     = true
}

variable "interface" {
    description = "Disk interface type"
    type        = string
    default     = "scsi0"
}

variable "import_from" {
    description = "Path to import disk from"
    type        = string
}

variable "ipv4_address" {
    description = "IPv4 address with CIDR notation"
    type        = string
}

variable "ipv4_gateway" {
    description = "IPv4 gateway address"
    type        = string
}

variable "user_data_file_id" {
    description = "ID of the cloud-init user data file"
    type        = string
}

variable "network_bridge" {
    description = "Network bridge to connect to"
    type        = string
    default     = "vmbr0"
}


variable "vm_cloud_image_id" {
    description = "Name for the downloaded Ubuntu cloud image"
    type        = string
}
