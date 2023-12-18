# outputs.tf/aks-cluster

output "aks_cluster_name" {
  description = "The name of the aks-cluster"
  value       =  azurerm_kubernetes_cluster.aks-cluster.name
}

output "aks_cluster_id" {
  description = "The id of the aks-cluster"
  value       =  azurerm_kubernetes_cluster.aks-cluster.id
}

output "aks_kubeconfig" {
  description = "The name of the kubenetes configuration"
  value       =  azurerm_kubernetes_cluster.aks-cluster.id
}