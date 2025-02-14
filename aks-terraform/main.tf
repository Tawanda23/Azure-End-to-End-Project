# main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.AZ_client_id
  client_secret   = var.AZ_client_secret_id
  subscription_id = var.AZ_subscription_id
  tenant_id       = var.AZ_tenant_id
}

module "networking" {
  source = "./networking-module"

  resource_group_name = "aks-networking-resource-group"
  location = "UK West"
  vnet_address_space = ["10.0.0.0/16"]
  secure_address       = var.secure_address
}

module "aks_cluster" {
    source = "./aks-cluster-module"

    aks_cluster_name                 = "terraform-aks-cluster"
    cluster_location                 =  "UK West"
    dns_prefix                       = "myaks-project"
    kubernetes_version               = "1.27.3"
    service_principal_client_id      = var.AZ_service_principal_client_id
    service_principal_client_secret  = var.AZ_service_principal_client_secret_id


    resource_group_name     = module.networking.resource_group_name
    vnet_id                 = module.networking.vnet_id
    control_plane_subnet_id = module.networking.control_plane_subnet_id
    worker_node_subnet_id   = module.networking.worker_node_subnet_id
    aks_nsg_id              = module.networking.aks_nsg_id
    
}



