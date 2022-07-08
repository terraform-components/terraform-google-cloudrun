variable "name" {
  type        = string
  description = "Name of the Service"
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
  description = "there is gen1 and gen2"
}

variable "container_concurrency" {
  type        = number
  default     = 100
  description = "how many requests can be handled at the same time"
}

variable "container_initial_image" {
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
  description = "container image to use"
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
  description = "do we want to route everything or just private ranges through the vpc?"
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
  type = map(string)
}
