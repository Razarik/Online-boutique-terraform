variable "project_id" {
  description = "The ID of the project where the cluster is hosted"
}

variable "region" {
  description = "The region in which to host the cluster"
}

variable "ip_range_subnet" {
  description = "The IP range for the subnet"
}

variable "ip_range_pods" {
  description = "The IP range to use for the pods"
}

variable "ip_range_services" {
  description = "The IP range to use for the services"
}