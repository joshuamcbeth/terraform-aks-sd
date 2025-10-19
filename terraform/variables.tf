
variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group"
  default     = "terraform-aks-cluster-rg"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "eastus"
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name"
  default     = "terraform-aks-cluster"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS cluster"
  default     = "terraform-aks-cluster"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for AKS"
  default     = "1.28.0"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 1
}

variable "node_vm_size" {
  type        = string
  description = "VM size for the default node pool"
  default     = "Standard_B2ps_v2"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {
    environment = "dev"
    project     = "terraform-aks-cluster"
  }
}
