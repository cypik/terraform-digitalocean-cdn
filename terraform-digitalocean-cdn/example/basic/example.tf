provider "digitalocean" {

}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "git::https://github.com/opz0/terraform-digitalocean-spaces.git?ref=v1.0.0"
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