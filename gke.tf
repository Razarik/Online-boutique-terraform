module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 12.0"
  project_id = var.project_id
  name = "${var.project_id}-gke-cluster"
  region = var.region
  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  ip_range_pods = "${var.project_id}-pod-range"
  ip_range_services = "${var.project_id}-service-range"
  skip_provisioners = true
}