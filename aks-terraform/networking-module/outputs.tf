# outputs.tf

output "vnet_id" {
  description = "The ID of the created Vnet."
  value       = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
  description = "The ID of the control plane."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "The ID of the worker node subnet."
  value       = azurerm_subnet.worker_node_subnet.id
}

output "resource_group_name" {
  description = "The name of the resource group for networking resources."
  value       = azurerm_resource_group.networking.name
}

output "aks_nsg_id" {
    description = "The ID of the NSG for AKS"
    value       = azurerm_network_security_group.aks_nsg
}