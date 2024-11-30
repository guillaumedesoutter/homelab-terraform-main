variable "terrafm_name" {
  description = "Nom de la VM terrafm"
  type        = string
}

variable "terrafm_cpu" {
  description = "Nombre de cœurs pour terrafm"
  type        = number
}

variable "terrafm_memory" {
  description = "Taille de la RAM (en Mo) pour terrafm"
  type        = number
}

variable "terrafm_disk" {
  description = "Taille du disque (en Go) pour terrafm"
  type        = number
}
