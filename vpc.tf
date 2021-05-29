resource "google_compute_network" "vpc" {
  name = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name = "${var.project_id}-subnet"
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = var.ip_range_subnet
  secondary_ip_range {
    ip_cidr_range = var.ip_range_pods
    range_name = "${var.project_id}-pod-range"
  }
  secondary_ip_range {
    ip_cidr_range = var.ip_range_services
    range_name = "${var.project_id}-service-range"
  }
}