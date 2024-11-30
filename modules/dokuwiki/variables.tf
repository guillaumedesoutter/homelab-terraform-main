variable "dokuwiki_name" {
  description = "Nom de la VM dokuwiki"
  type        = string
}

variable "dokuwiki_cpu" {
  description = "Nombre de cœurs pour dokuwiki"
  type        = number
}

variable "dokuwiki_memory" {
  description = "Taille de la RAM (en Mo) pour dokuwiki"
  type        = number
}

variable "dokuwiki_disk" {
  description = "Taille du disque (en Go) pour dokuwiki"
  type        = number
}
