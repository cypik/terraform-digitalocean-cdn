provider "digitalocean" {

}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "git::git@github.com:thebaldev/digitalocean-spaces.git"
  name          = "spaces"
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