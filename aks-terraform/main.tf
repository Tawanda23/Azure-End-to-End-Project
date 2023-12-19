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
  client_id       = "c34343f2-77da-4422-a660-81a6f005ebfc"
  client_secret   = "j618Q~jJd_H0~5g-GpAmT9I5B1QoLX4MpJuoYagb"
  subscription_id = "60c8c8a1-0483-4b2e-a83e-b6a5cccda4ca"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "networking" {
  source = "./networking-module"

  resource_group_name = "aks-networking-resource-group"
  location = "UK West"
  vnet_address_space = ["10.0.0.0/16"]
}

module "aks_cluster" {
    source = "./aks-cluster-module"

    aks_cluster_name                 = "terraform-aks-cluster"
    cluster_location                 =  "UK West"
    dns_prefix                       = "myaks-project"
    kubernetes_version               = "1.27.3"
    service_principal_client_id      = "cd15f14e-6c1b-4e3a-bf05-6f160f2782e6"
    service_principal_client_secret  = "GY38Q~p6E3EPmkXcqcQB2m~e0tdqXEtFWLlkMafq"


    resource_group_name     = module.networking.resource_group_name
    vnet_id                 = module.networking.vnet_id
    control_plane_subnet_id = module.networking.control_plane_subnet_id
    worker_node_subnet_id   = module.networking.worker_node_subnet_id
    aks_nsg_id              = module.networking.aks_nsg_id
    
}