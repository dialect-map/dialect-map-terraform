# Enables the API to manage resources

resource "google_project_service" "storage-api" {
  project = var.project_id
  service = "storage-component.googleapis.com"
}


# List of resources associated to the module

resource "google_storage_bucket_iam_binding" "registry-bucket-admin-binding" {
  bucket = var.registry_bucket_name
  role   = "roles/storage.admin"
  members = [
    "projectOwner:${var.project_id}",
  ]

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.storage-api]
}


resource "google_storage_bucket_iam_binding" "registry-object-admin-binding" {
  bucket = var.registry_bucket_name
  role   = "roles/storage.objectAdmin"
  members = [
    "projectOwner:${var.project_id}",
    "projectEditor:${var.project_id}",
  ]

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.storage-api]
}


resource "google_storage_bucket_iam_binding" "registry-object-viewer-binding" {
  bucket = var.registry_bucket_name
  role   = "roles/storage.objectViewer"
  members = [
    "projectViewer:${var.project_id}",
  ]

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.storage-api]
}
