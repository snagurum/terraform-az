locals {

}

module "vnet" {
  source              = "../../modules/core/vnet"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

}

module "public_subnet" {
  source              = "../../modules/core/subnet"
  name                = var.name
  vnet_name           = module.vnet.name
  resource_group_name = var.resource_group_name
  address_prefixes    = var.public_address_space
  is_private          = false
}

module "private_subnet" {
  source              = "../../modules/core/subnet"
  name                = var.name
  vnet_name           = module.vnet.name
  resource_group_name = var.resource_group_name
  address_prefixes    = var.private_address_space
}

module "nsg_public_subnet" {
  count         = length(var.public_ingress_rules) != 0 ? 1 : 0
  source        = "../../modules/core/nsg"
  name          = "${var.name}-public"
  rg_name       = var.resource_group_name
  rg_location   = var.location
  ingress_rules = var.public_ingress_rules
}

module "public_subnet_nsg_association" {
  source     = "../../modules/core/subnet_nsg_assoc"
  subnet_map = module.public_subnet.subnet_map
  nsg_id     = module.nsg_public_subnet[0].id
  count      = length(var.public_ingress_rules) != 0 ? length(var.public_ingress_rules) : 0
}

module "nsg_private_subnet" {
  count         = length(var.private_ingress_rules) != 0 ? 1 : 0
  source        = "../../modules/core/nsg"
  name          = "${var.name}-private"
  rg_name       = var.resource_group_name
  rg_location   = var.location
  ingress_rules = var.private_ingress_rules
}

module "private_subnet_nsg_association" {
  source     = "../../modules/core/subnet_nsg_assoc"
  subnet_map = module.private_subnet.subnet_map
  nsg_id     = module.nsg_private_subnet[0].id
  count      = length(var.private_ingress_rules) != 0 ? length(var.private_ingress_rules) : 0
}
