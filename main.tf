#This is a root module that includes the VPC and web modules.
module "vpc" {
  source = "./vpc"
}

module "web" {
  source = "./web"
  ps = module.vpc.public_subnet
  sg = module.vpc.security_group
}

