terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features         {}
  client_id       = "0d853e5d-1398-4958-b9a7-bb8448d47bd5"
  client_secret   = "Kht8Q~p2ftEMIzjNGfyh.F764WSdor~gnSDPvcEu"
  subscription_id = "e64a8fc7-dc70-4104-8933-7664dab62c2a"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "networking" {
  source              = "./modules/networking-module"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_name = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space
  subnet_name          = var.subnet_name
  subnet_address_prefixes     = var.subnet_address_prefixes
}

module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.26.6"  # Adjust the version as needed
  service_principal_client_id = "" # Enter your Client ID
  service_principal_client_secret = "" # Enter your password for your client ID

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.network_resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id

}
