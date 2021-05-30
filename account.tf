resource "google_service_account" "gke-least-privilege-account" {
  account_id = "gke-least-privilege-account"
  display_name = "Service Account for GKE"
}

resource "google_project_iam_member" "log-writer" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.gke-least-privilege-account.email}"
  role = "roles/logging.logWriter"
}

resource "google_project_iam_member" "metric-writer" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.gke-least-privilege-account.email}"
  role = "roles/monitoring.metricWriter"
}

resource "google_project_iam_member" "viewer" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.gke-least-privilege-account.email}"
  role = "roles/monitoring.viewer"
}

resource "google_project_iam_member" "stackdriver-writer" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.gke-least-privilege-account.email}"
  role = "roles/stackdriver.resourceMetadata.writer"
}