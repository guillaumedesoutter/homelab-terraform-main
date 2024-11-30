variable "gitlab_name" {
  description = "Nom de la VM gitlab"
  type        = string
}

variable "gitlab_cpu" {
  description = "Nombre de cœurs pour gitlab"
  type        = number
}

variable "gitlab_memory" {
  description = "Taille de la RAM (en Mo) pour gitlab"
  type        = number
}

variable "gitlab_disk" {
  description = "Taille du disque (en Go) pour gitlab"
  type        = number
}
