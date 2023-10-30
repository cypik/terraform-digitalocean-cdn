resource "digitalocean_cdn" "main" {
  count            = var.enabled ? 1 : 0
  origin           = var.origin
  ttl              = var.ttl
  custom_domain    = var.custom_domain
  certificate_name = var.certificate_name
}