variable "name_format" {
  type = object({
    name1 = string
  })
  default = {
    name1 = "%s"
  }
}

variable "name" {
  type        = string
  description = "Name of the Cloud Run Service. Cloud Run names are unique within the project and location. This means you can keep the name the same across regions, if you prefer this."
}

variable "region" {
  type        = string
  description = "Region the service will be running in"
}

variable "service_account_email" {
  type        = string
  description = "Service account email used for the service authenticating to others"
}

variable "invokers" {
  type        = list(string)
  default     = ["allUsers"]
  description = <<-EOT
    **allUsers**: Anyone on the Internet

    **allAuthenticatedUsers**: Anyone logged in with a Google Account

    **user:{email}**: A specific user

    **serviceAccount:{email}**: Service Account

    **group:{email}**: Google Group

    **domain:{domain}**: G Suite domain

    **projectOwner:{project_id}**: Owners of that project

    **projectEditor:{project_id}**: Editors of that project

    **projectViewer:{projectid}**: Viewers of that project
    EOT
}

variable "ingress" {
  type        = string
  default     = "internal-and-cloud-load-balancing"
  description = <<-EOT
    **all**: Public

    **internal**: Inbound from VPC

    **internal-and-cloud-load-balancing**: Inbound from VPC and Cloud Load Balancing

    https://cloud.google.com/sdk/gcloud/reference/run/deploy#--ingress
    EOT
}

variable "execution_environment" {
  type        = string
  default     = "gen1"
  description = <<-EOT
    gen1 or gen2

    more detail on the up and downsides of the new (in preview) execution environment: https://cloud.google.com/run/docs/about-execution-environments
    EOT
}

variable "container_concurrency" {
  type        = number
  default     = 100
  description = <<-EOT
    How many requests can be handled at the same time. 

    **This is a critical setting for cloudrun**

    Read more: https://cloud.google.com/run/docs/about-concurrency
    EOT
}

variable "container_initial_image" {
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
  description = "The initial image to use for the container. Be aware that we are ignoring changes to this as terraform is not very good at managing your application deployments. However we need an initial image to set, so we can deploy cloudrun itself the first time around and manage the bits we want to manage here."
}

variable "min_scale" {
  type        = number
  default     = 0
  description = "minimum number of instances"
}

variable "max_scale" {
  type        = number
  default     = 5
  description = "maximum number of instances"
}

variable "vpc_access_egress" {
  type        = string
  default     = "private-ranges-only"
  description = <<-EOT
    **private-ranges-only**: Only route private ranges through the VPC
    
    **all-traffic**: Route all traffic through the VPC. Be aware this will incur additional cost and may not be suitable. It gives you a lot more control however, so depending on your use case this may be the right way to go.
    EOT
}

variable "vpc_access_connector" {
  type        = string
  default     = null
  description = "if set, this will use that vpc access connector of a connected vpc"
}

variable "cloudsql_connection_name" {
  type        = string
  default     = null
  description = "if set will populate the cloud sql connection name"
}

variable "environment_variables" {
  type        = map(string)
  default     = {}
  description = "values to set in the environment"
}

variable "secret_environment_variables" {
  type = map(object({
    secret_name = string
    version     = string
  }))
  default     = {}
  description = <<-EOT
    {
      "ENV_VAR_NAME": {
        "secret_name": "123",
        "version": "latest"
      }
    }
    

    You have different ways to access a secret.
    One of the ways is just to let your application do that, as there is SDK and APIs for doing so.

    https://cloud.google.com/secret-manager/docs/creating-and-accessing-secrets#access

    However you can also use the cloud run feature to retrieve secrets as environment variables.
    This may have security concerns, but as long as you have good processes around images and what goes into them,
    those concerns are not necessarily prohibitive.

    When it comes to secrets, you may want to consider having key-secret pairs instead of separate values.
    Having pairs allows you to have rotation of secrets without downtime as you can alternate between 2 keys/users etc and make sure
    to simply do that more often than you would with a single key/user. This way you do not need to synchronize when the use
    of the key/secret are switched and effectively decoupled those to a degree. 
    It is not failsafe to do this, but has a lot less issues.
    The simplest way to achieve this is to have a secret with a json inside that has the key/value pairs you want to use.
    EOT
}

variable "secret_files" {
  type = map(object({
    secret_name  = string
    default_mode = optional(string)
    files = map(object({
      version = string
      mode    = optional(string)
    }))
  }))
  default     = {}
  description = <<-EOT
    You have different ways to access a secret.
    One of the ways is just to let your application do that, as there is SDK and APIs for doing so.

    https://cloud.google.com/secret-manager/docs/creating-and-accessing-secrets#access

    This allows you to mount a secret as files, which may be useful at times.

    It also allows you to mount multiple versions for rotation purposes.

    "/mount/path" = {
      secret_name = "123"
      files = {
        "foo.pem" = {
          version = "latest"
          mode = "0644"
        }
      }
    }
    EOT
}
