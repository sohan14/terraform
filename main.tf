module "resource" {
  source = "./resourceGroup"
  name = "appgrp"
  location = "Central India"
}

module "networking" {
  source = "./networking"
  resource_group_name = module.resource.resource_group.name
  location = module.resource.resource_group.location
  depends_on = [ module.resource ]
}

module "compute" {
  source = "./compute"
  depends_on = [ module.resource,module.networking ]
  resource_group_name = module.resource.resource_group.name
  location = module.resource.resource_group.location
  subnet_id = module.networking.subnet.id
}