variable "vnet_name" {
  description = "Nombre de la VNet"
  type        = string
}

variable "vnet_address_space" {
  description = "Espacio de direcciones de la VNet"
  type        = list(string)
}

variable "location" {
  description = "Ubicación del recurso"
  type        = string
}

variable "existent_resource_group_name" {
  description = "Nombre del grupo de recursos existente"
  type        = string
}

variable "owner_tag" {
  description = "Propietario de la VNet"
  type        = string
}

variable "environment_tag" {
  description = "Entorno de la VNet (dev, test, prod, etc.)"
  type        = string
}

variable "vnet_tags" {
  description = "Tags adicionales que se aplicarán a la VNet"
  type        = map(string)
  default     = {}
}
