output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The name of the AKS cluster"
}

output "aks_cluster_resource_group" {
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
  description = "The resource group where AKS nodes are deployed"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "Raw kubeconfig to connect to the cluster"
  sensitive   = true
}

output "aks_api_server" {
  value       = azurerm_kubernetes_cluster.aks.fqdn
  description = "AKS API server FQDN"
}
