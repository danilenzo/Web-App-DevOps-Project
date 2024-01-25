module "networking" {
  source = "./path/to/networking_module"
  # Add other networking module configuration here
}

# Import the cluster module
module "aks_cluster" {
  source            = "./path/to/aks_cluster_module"
  cluster_name      = "terraform-aks-cluster"
  location          = "UK South"
  dns_prefix        = "myaks-project"
  kubernetes_version = "1.26.6"

  # Reference variables from the networking module
  resource_group_name      = module.networking.resource_group_name
  vnet_id                  = module.networking.vnet_id
  control_plane_subnet_id  = module.networking.control_plane_subnet_id
  worker_node_subnet_id    = module.networking.worker_node_subnet_id
  aks_nsg_id               = module.networking.aks_nsg_id

  # Provide your service principal credentials
  service_principal_client_id = "0d853e5d-1398-4958-b9a7-bb8448d47bd5"
  service_principal_secret    = "Kht8Q~p2ftEMIzjNGfyh.F764WSdor~gnSDPvcEu"
}