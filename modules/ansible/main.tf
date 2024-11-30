terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

resource "proxmox_vm_qemu" "blueprint" {
  name        = var.ansible_name
  target_node = "pve"
  clone       = "template-u24ci"

  cores       = var.ansible_cpu
  memory      = var.ansible_memory

  # Configuration réseau
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Disque principal
  scsihw      = "virtio-scsi-pci"
  disk {
    size    = "${var.ansible_disk}G"
    type    = "disk"
    storage = "local-lvm"
    slot    = "scsi0"
  }

  # Ajout du disque Cloud-Init
  disk {
    type    = "cloudinit"
    storage = "local-lvm"
    slot    = "ide2"
  }

  # Configuration IP statique pour Cloud-Init
  ipconfig0 = "ip=192.168.1.12/24,gw=192.168.1.1"

  # Ajout des paramètres personnalisés (facultatif)
  cicustom = "user=local:snippets/settings-ci.yaml"
}

output "ip_v4" {
  value = "192.168.1.12"
}
