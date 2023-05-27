resource "google_service_account" "bastion-host" {
  account_id   = "${var.name_prefix}-sa-bastion-host"
  display_name = "A service account for cc class"
}

resource "google_project_iam_member" "ssh-metadata" {
  project = var.gcp_project
  role    = "roles/compute.instanceAdmin.v1"
  member  = "serviceAccount:${google_service_account.bastion-host.email}"

}

resource "google_project_iam_member" "instance-viewer" {
  project = var.gcp_project
  role    = "roles/compute.viewer"
  member  = "serviceAccount:${google_service_account.bastion-host.email}"
}

resource "google_project_iam_member" "internal-ssh" {
  project = var.gcp_project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.bastion-host.email}"
}