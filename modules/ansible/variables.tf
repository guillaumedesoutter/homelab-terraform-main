variable "ansible_name" {
  description = "Nom de la VM ansible"
  type        = string
}

variable "ansible_cpu" {
  description = "Nombre de cœurs pour ansible"
  type        = number
}

variable "ansible_memory" {
  description = "Taille de la RAM (en Mo) pour ansible"
  type        = number
}

variable "ansible_disk" {
  description = "Taille du disque (en Go) pour ansible"
  type        = number
}
