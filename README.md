<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_region_network_endpoint_group.main](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_region_network_endpoint_group) | resource |
| [google_cloud_run_service.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service_iam_binding.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudsql_connection_name"></a> [cloudsql\_connection\_name](#input\_cloudsql\_connection\_name) | if set will populate the cloud sql connection name | `string` | `null` | no |
| <a name="input_container_concurrency"></a> [container\_concurrency](#input\_container\_concurrency) | how many requests can be handled at the same time | `number` | `100` | no |
| <a name="input_container_initial_image"></a> [container\_initial\_image](#input\_container\_initial\_image) | container image to use | `string` | `"us-docker.pkg.dev/cloudrun/container/hello"` | no |
| <a name="input_execution_environment"></a> [execution\_environment](#input\_execution\_environment) | there is gen1 and gen2 | `string` | `"gen1"` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | ingress could be public or just from load balancing and/or internal | `string` | `"internal-and-cloud-load-balancing"` | no |
| <a name="input_invokers"></a> [invokers](#input\_invokers) | who can invoke cloud run. allUsers means everyone, which means 'public' | `list(string)` | <pre>[<br>  "allUsers"<br>]</pre> | no |
| <a name="input_max_scale"></a> [max\_scale](#input\_max\_scale) | maximum number of instances | `number` | `5` | no |
| <a name="input_min_scale"></a> [min\_scale](#input\_min\_scale) | minimum number of instances | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the service | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region the service will be running in | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | service account email used for permissions | `string` | n/a | yes |
| <a name="input_vpc_access_connector"></a> [vpc\_access\_connector](#input\_vpc\_access\_connector) | if set, this will use that vpc access connector of a connected vpc | `string` | `null` | no |
| <a name="input_vpc_access_egress"></a> [vpc\_access\_egress](#input\_vpc\_access\_egress) | do we want to route everything or just private ranges through the vpc? | `string` | `"private-ranges-only"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_endpoint_group_id"></a> [network\_endpoint\_group\_id](#output\_network\_endpoint\_group\_id) | n/a |
<!-- END_TF_DOCS -->