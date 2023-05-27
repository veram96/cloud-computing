resource "google_project_iam_custom_role" "bucket" {
  role_id     = "CursoStorage"
  title       = "Curso Storage"
  description = "Rol para permitir a los asistentes al curso crear buckets"
  permissions = ["storage.buckets.list", "storage.buckets.create", "storage.objects.list", "storage.objects.update", "storage.objects.create"]
  lifecycle {
    prevent_destroy = true
  }
}


resource "google_project_iam_binding" "project" {
  project = var.gcp_project
  role    = google_project_iam_custom_role.bucket.id

  members = var.users_list
}