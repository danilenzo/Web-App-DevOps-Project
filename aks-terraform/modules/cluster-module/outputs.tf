output "aks_cluster_name" {
  description = "The name of the provisioned AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_id" {
  description = "The ID of the provisioned AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_kubeconfig" {
  description = "The Kubernetes configuration file for the provisioned AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].raw_kube_config
}
output "aks_cluster_name" {
  description = "The name of the provisioned cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_kubeconfig" {
  description = "The kubernetes configuration file of the cluster. Uses kubectl to interact with and managing the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}