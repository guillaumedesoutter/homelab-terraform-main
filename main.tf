terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}


provider "proxmox" {
  pm_api_url      = "https://192.168.1.99:8006/api2/json"
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

module "terraform" {
  source        = "./modules/rundeck"
  roboport_name   = var.roboport_name
  roboport_cpu    = var.roboport_cpu
  roboport_memory = var.roboport_memory
  roboport_disk   = var.roboport_disk
}
