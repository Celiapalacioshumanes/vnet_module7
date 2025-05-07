variable "vnet_name" {
  type = string
}
variable "vnet_address_space" {
  type = list(string)
}
variable "location" {
  type = string
}
variable "existent_resource_group_name" {
  type = string
}
variable "owner_tag" {
  type = string
}
variable "environment_tag" {
  type = string
}
variable "vnet_tags" {
  type    = map(string)
  default = {}
}
variable "subnets" {
  description = "Lista de subredes con NSG opcional"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    nsg = optional(object({
      name           = string
      security_rules = list(object({
        name                       = string
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = string
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string
      }))
    }))
  }))
  default = []
}

