variable "roboport_name" {
  description = "Nom de la VM roboport"
  type        = string
}

variable "roboport_cpu" {
  description = "Nombre de cœurs pour roboport"
  type        = number
}

variable "roboport_memory" {
  description = "Taille de la RAM (en Mo) pour roboport"
  type        = number
}

variable "roboport_disk" {
  description = "Taille du disque (en Go) pour roboport"
  type        = number
}
