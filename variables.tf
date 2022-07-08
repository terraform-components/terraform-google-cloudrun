variable "name" {
  type        = string
  description = "name of the service"
}

variable "region" {
  type        = string
  description = "region the service will be running in"
}

variable "service_account_email" {
  type        = string
  description = "service account email used for permissions"
}

variable "invokers" {
  type        = list(string)
  default     = ["allUsers"]
  description = "who can invoke cloud run. allUsers means everyone, which means 'public'"
}

variable "ingress" {
  type        = string
  default     = "internal-and-cloud-load-balancing"
  description = "ingress could be public or just from load balancing and/or internal"
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
