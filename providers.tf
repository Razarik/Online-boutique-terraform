terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.69.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

data "google_client_config" "default" {
}

provider "kubernetes" {
  host = "https://${module.gke.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
