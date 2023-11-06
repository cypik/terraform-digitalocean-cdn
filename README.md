# terraform-digitalocean-cdn
# DigitalOcean Terraform Configuration

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This Terraform configuration is designed to create and manage a DigitalOcean cdn.

## Usage
To use this module, you should have Terraform installed and configured for DIGITALOCEAN. This module provides the necessary Terraform configuration for creating DIGITALOCEAN resources, and you can customize the inputs as needed. Below is an example of how to use this module:

- # complete example
You can use this module in your Terraform configuration like this:

```hcl

module "cdn" {
  depends_on       = [module.spaces]
  source           = "git::https://github.com/opz0/terraform-digitalocean-cdn.git?ref=v1.0.0"
  origin           = module.spaces.bucket_domain_name
  ttl              = 3600
  custom_domain    = null
  certificate_name = null
}
```
Please replace "your_database_cluster_id" with the actual ID of your DigitalOcean database cdn, and adjust the kubernetes rules as needed.


- # basic example
You can use this module in your Terraform configuration like this:
```hcl
module "cdn" {
  source = "git::https://github.com/opz0/terraform-digitalocean-cdn.git?ref=v1.0.0"
  origin = module.spaces.bucket_domain_name
  ttl    = 3600
}
```
This example demonstrates how to create various DIGITALOCEAN resources using the provided modules. Adjust the input values to suit your specific requirements.


## Module Inputs

- 'origin': The fully qualified domain name, (FQDN) for a Space.
- 'ttl' : The time to live for the CDN Endpoint, in seconds. Default is 3600 seconds.
- 'custom_domain' : The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint.
- 'certificate_name' : The unique name of a DigitalOcean managed TLS certificate used for SSL when a custom subdomain is provided.

## Module Outputs

This module does not produce any outputs. It is primarily used for labeling resources within your Terraform configuration.

- 'id' : A unique ID that can be used to identify and reference a CDN Endpoint.
- 'origin' The fully qualified domain name, (FQDN) of a space referenced by the CDN Endpoint.
- 'endpoint' The fully qualified domain name (FQDN) from which the CDN-backed content is served.
- 'created_at'  The date and time when the CDN Endpoint was created.
- 'ttl' The time to live for the CDN Endpoint, in seconds.
- 'custom_domain' The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint.

## Examples
For detailed examples on how to use this module, please refer to the 'examples' directory within this repository.

## License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/opz0/terraform-digitalocean-cdn/blob/readme/LICENSE) file for more details.

## Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.