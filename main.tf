terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id            = var.az_subscription_id
  skip_provider_registration = true
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.az_name_prefix}-aks"
  kubernetes_version  = var.kubernetes_version
  location            = var.region
  resource_group_name = var.az_resource_group
  dns_prefix          = var.az_name_prefix

  default_node_pool {
    name                = "system"
    node_count          = var.min_node_count
    vm_size             = var.node_vm_size
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    min_count           = var.min_node_count
    max_count           = var.max_node_count
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

resource "null_resource" "post_provisioning" {
  depends_on = [azurerm_kubernetes_cluster.aks]
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${var.az_resource_group} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
  }
}