# Terraform-digitalocean-cdn
# Terraform DigitalOcean cloud cdn Module

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This Terraform configuration is designed to create and manage a DigitalOcean cdn.

## Usage
To use this module, you should have Terraform installed and configured for DIGITALOCEAN. This module provides the necessary Terraform configuration for creating DIGITALOCEAN resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example: Complete
You can use this module in your Terraform configuration like this:

```hcl

module "cdn" {
  depends_on       = [module.spaces]
  source           = "cypik/cdn/digitalocean"
  version          = "1.0.1"
  origin           = module.spaces.bucket_domain_name
  ttl              = 3600
  custom_domain    = null
  certificate_name = null
}
```
Please replace "your_database_cluster_id" with the actual ID of your DigitalOcean database cdn, and adjust the kubernetes rules as needed.


# Example: Basic
You can use this module in your Terraform configuration like this:
```hcl
module "cdn" {
  source = "cypik/cdn/digitalocean"
  version = "1.0.1"
  origin = module.spaces.bucket_domain_name
  ttl    = 3600
}
```
This example demonstrates how to create various DIGITALOCEAN resources using the provided modules. Adjust the input values to suit your specific requirements.


## Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/cypik/terraform-digitalocean-cdn/blob/master/example) directory within this repository.

## Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/cypik/terraform-digitalocean-cdn/blob/master/LICENSE) file for more details.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.34.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.34.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_cdn.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/cdn) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_name"></a> [certificate\_name](#input\_certificate\_name) | The unique name of a DigitalOcean managed TLS certificate used for SSL when a custom subdomain is provided. | `string` | `null` | no |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to create the resources. Set to `false` to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_origin"></a> [origin](#input\_origin) | The fully qualified domain name, (FQDN) for a Space. | `string` | `""` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The time to live for the CDN Endpoint, in seconds. Default is 3600 seconds | `number` | `3600` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The date and time when the CDN Endpoint was created. |
| <a name="output_custom_domain"></a> [custom\_domain](#output\_custom\_domain) | The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The fully qualified domain name (FQDN) from which the CDN-backed content is served. |
| <a name="output_id"></a> [id](#output\_id) | A unique ID that can be used to identify and reference a CDN Endpoint. |
| <a name="output_origin"></a> [origin](#output\_origin) | The fully qualified domain name, (FQDN) of a space referenced by the CDN Endpoint. |
| <a name="output_ttl"></a> [ttl](#output\_ttl) | The time to live for the CDN Endpoint, in seconds. |
<!-- END_TF_DOCS -->