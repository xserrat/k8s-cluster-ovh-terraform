# Cluster basics
variable "ovh_project_id" { type = string }
variable "ovh_region" { type = string }
variable "cluster_name" {
  type        = string

  validation {
    condition     = !can(regex("_", var.cluster_name))
    error_message = "You cannot use '_' char for the cluster_name."
  }
}
variable "kube_version" {
  type = number
  default = 1.24
}

#Node Pool
variable "ovh_node_pool_size" { type = string }
variable "desired_nodes" { type = number }
variable "max_nodes" { type = number }
variable "min_nodes" { type = number }

# Common
variable "environment" { type = string }
