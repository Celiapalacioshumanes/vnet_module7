module "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  source              = "./module/subnet"
  name                = each.value.name
  address_prefixes    = each.value.address_prefixes
  vnet_name           = azurerm_virtual_network.vnet.name
  resource_group_name = var.existent_resource_group_name
}

module "nsg" {
  for_each = {
    for subnet in var.subnet : subnet.name => subnet.nsg
    if contains(keys(subnet), "nsg")
  }

  source              = "./module/nsg"
  name                = each.value.name
  location            = var.location
  resource_group_name = var.existent_resource_group_name
  security_rules      = each.value.security_rules
}
