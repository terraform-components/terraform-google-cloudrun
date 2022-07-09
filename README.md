# Terraform Module for Google Cloudrun

For Cloud Run it is recommended to read this FAQ as it will answer many questions already: [ahmetb/cloud-run-faq](https://github.com/ahmetb/cloud-run-faq)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_google"></a> [google](#provider\_google)

- <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [google-beta_google_compute_region_network_endpoint_group.main](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_region_network_endpoint_group) (resource)
- [google_cloud_run_service.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) (resource)
- [google_cloud_run_service_iam_binding.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_binding) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables)

Description: values to set in the environment

Type: `map(string)`

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the Service

Type: `string`

### <a name="input_region"></a> [region](#input\_region)

Description: Region the service will be running in

Type: `string`

### <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email)

Description: Service account email used for the service authenticating to others

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cloudsql_connection_name"></a> [cloudsql\_connection\_name](#input\_cloudsql\_connection\_name)

Description: if set will populate the cloud sql connection name

Type: `string`

Default: `null`

### <a name="input_container_concurrency"></a> [container\_concurrency](#input\_container\_concurrency)

Description: How many requests can be handled at the same time.

**This is a critical setting for cloudrun**

Read more: https://cloud.google.com/run/docs/about-concurrency

Type: `number`

Default: `100`

### <a name="input_container_initial_image"></a> [container\_initial\_image](#input\_container\_initial\_image)

Description: The initial image to use for the container. Be aware that we are ignoring changes to this as terraform is not very good at managing your application deployments. However we need an initial image to set, so we can deploy cloudrun itself the first time around and manage the bits we want to manage here.

Type: `string`

Default: `"us-docker.pkg.dev/cloudrun/container/hello"`

### <a name="input_execution_environment"></a> [execution\_environment](#input\_execution\_environment)

Description: gen1 or gen2

more detail on the up and downsides of the new (in preview) execution environment: https://cloud.google.com/run/docs/about-execution-environments

Type: `string`

Default: `"gen1"`

### <a name="input_ingress"></a> [ingress](#input\_ingress)

Description: **all**: Public

**internal**: Inbound from VPC

**internal-and-cloud-load-balancing**: Inbound from VPC and Cloud Load Balancing

https://cloud.google.com/sdk/gcloud/reference/run/deploy#--ingress

Type: `string`

Default: `"internal-and-cloud-load-balancing"`

### <a name="input_invokers"></a> [invokers](#input\_invokers)

Description: **allUsers**: Anyone on the Internet

**allAuthenticatedUsers**: Anyone logged in with a Google Account

**user:{email}**: A specific user

**serviceAccount:{email}**: Service Account

**group:{email}**: Google Group

**domain:{domain}**: G Suite domain

**projectOwner:{project\_id}**: Owners of that project

**projectEditor:{project\_id}**: Editors of that project

**projectViewer:{projectid}**: Viewers of that project

Type: `list(string)`

Default:

```json
[
  "allUsers"
]
```

### <a name="input_max_scale"></a> [max\_scale](#input\_max\_scale)

Description: maximum number of instances

Type: `number`

Default: `5`

### <a name="input_min_scale"></a> [min\_scale](#input\_min\_scale)

Description: minimum number of instances

Type: `number`

Default: `0`

### <a name="input_name_format"></a> [name\_format](#input\_name\_format)

Description: n/a

Type:

```hcl
object({
    name1 = string
  })
```

Default:

```json
{
  "name1": "%s"
}
```

### <a name="input_vpc_access_connector"></a> [vpc\_access\_connector](#input\_vpc\_access\_connector)

Description: if set, this will use that vpc access connector of a connected vpc

Type: `string`

Default: `null`

### <a name="input_vpc_access_egress"></a> [vpc\_access\_egress](#input\_vpc\_access\_egress)

Description: **private-ranges-only**: Only route private ranges through the VPC

**all-traffic**: Route all traffic through the VPC. Be aware this will incur additional cost and may not be suitable. It gives you a lot more control however, so depending on your use case this may be the right way to go.

Type: `string`

Default: `"private-ranges-only"`

## Outputs

The following outputs are exported:

### <a name="output_network_endpoint_group_id"></a> [network\_endpoint\_group\_id](#output\_network\_endpoint\_group\_id)

Description: ID of the regional Serverless Network Endpoint Group, that can be used with Cloud Load Balancing
<!-- END_TF_DOCS -->