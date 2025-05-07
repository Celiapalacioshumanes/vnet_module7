variable "nsg" {
  type = object({
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
  })
}
variable "subnet_name" { type = string }
variable "resource_group_name" { type = string }
variable "vnet_name" { type = string }
variable "location" { type = string }

