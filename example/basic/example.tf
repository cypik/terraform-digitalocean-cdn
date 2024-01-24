provider "digitalocean" {

}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "cypik/spaces/digitalocean"
  version       = "1.0.1"
  name          = "spaces1"
  environment   = "test"
  acl           = "private"
  force_destroy = false
  region        = "nyc3"
}

##------------------------------------------------
## cdn module call
##------------------------------------------------
module "cdn" {
  source = "./../../"
  origin = module.spaces.bucket_domain_name
  ttl    = 3600
}