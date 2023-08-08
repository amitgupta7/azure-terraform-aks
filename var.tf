variable "az_subscription_id" {
  description = "azure subscription id"
  type        = string
}

variable "region" {
  default = "westus2"
}


variable "az_resource_group" {
  description = "resource group name to create these resources"
}

variable "az_name_prefix" {
  description = "prefix to add to resource names"
  default     = "azure-tf-aks"
}

variable "node_vm_size" {
  default = "Standard_D4_v2"
}

variable "min_node_count" {
  default     = "2"
  description = "AKS min nodes"
}

variable "max_node_count" {
  default     = "4"
  description = "AKS max nodes"
}

variable "kubernetes_version" {
  default     = "1.24.10"
  description = "Kubernetes version"
}