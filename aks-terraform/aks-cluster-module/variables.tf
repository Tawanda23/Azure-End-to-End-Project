# variables.tf/aks-cluster
variable "aks_cluster_name" {
    description = "AKS Cluster name"
    type        = string 
}

variable "cluster_location" {
    description = "Region where AKS Cluster will be provisioned"
    type        = string 
}

variable "dns_prefix" {
    description = "Name of cluster dns prefix"
    type        = string 
}

variable "kubernetes_version" {
    description = "Kubernetes Version"
    type        = string 
}

variable "service_principal_client_id" {
    description = "service principal client"
    type        = string 
}

variable "service_principal_client_secret" {
    description = "service principal secret"
    type        = string 
}

variable "resource_group_name" {
    description = "Name of Resource Group created"
    type        = string 
}

variable "vnet_id" {
    description = "ID of Virtual Network created"
    type        = string 
}

variable "control_plane_subnet_id" {
    description = "ID of Control Plane Subnet created"
    type        = string 
}

variable "worker_node_subnet_id" {
    description = "ID of Worker Node Subnet created"
    type        = string 
}