provider "digitalocean" {

}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "git::git@github.com:thebaldev/digitalocean-spaces.git"
  name          = "classmet-rest"
  acl           = "private"
  force_destroy = false
  region        = "nyc3"
}

##------------------------------------------------
## cdn module call
##------------------------------------------------
module "cdn" {
  depends_on       = [module.spaces]
  source           = "./../../"
  origin           = module.spaces.bucket_domain_name
  ttl              = 3600
  custom_domain    = null
  certificate_name = null
}