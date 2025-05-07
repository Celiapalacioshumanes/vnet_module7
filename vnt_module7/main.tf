module "vnet" {
  source = "git::https://github.com/Celiapalacioshumanes/vnt_module6.git?ref=main"

  vnet_name                    = var.vnet_name
  vnet_address_space           = var.vnet_address_space
  location                     = var.location
  existent_resource_group_name = var.existent_resource_group_name
  owner_tag                    = var.owner_tag
  environment_tag              = var.environment_tag
  vnet_tags                    = var.vnet_tags
}

module "subnets" {
  source   = "./modules/subnet"
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  vnet_name           = var.vnet_name
  resource_group_name = var.existent_resource_group_name
  name                = each.value.name
  address_prefixes    = each.value.address_prefixes
}

module "nsgs" {
  source   = "./modules/nsg"
  for_each = { for subnet in var.subnets : subnet.name => subnet if contains(keys(subnet), "nsg") }

  vnet_name           = var.vnet_name
  resource_group_name = var.existent_resource_group_name
  subnet_name         = each.key
  nsg                 = each.value.nsg
  location            = var.location
}

