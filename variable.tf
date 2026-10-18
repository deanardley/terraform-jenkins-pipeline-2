variable "vpcname" {
  description = "This is VPC name"
  type        = string
  default     = "vpc-network"
}

variable "subnetname" {
  description = "This is subnet name"
  type        = string
  default     = "test-subnetwork-1"
}

variable "subnet2name" {
  description = "This is subnet name"
  type        = string
  default     = "test-subnetwork-2"
}

variable "firewallname" {
  description = "This is firewall name"
  type        = string
  default     = "test-firewall"
}

variable "vmname" {
  description = "This is instance name"
  type        = string
  default     = "my-instance"
}

variable "machinetype" {
  description = "This is machine type"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "This is zone name"
  type        = string
  default     = "us-central1-a"
}

variable "vmimage" {
  description = "This is image name"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "machinesize" {
  description = "This is machine size"
  type        = string
  default     = 15
}