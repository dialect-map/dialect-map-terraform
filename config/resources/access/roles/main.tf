# List of resources associated to the module

resource "google_project_iam_binding" "project-owner-role" {
  project = var.project_id
  role    = "roles/owner"

  members = [
    "user:kc90@nyu.edu",
    "user:spp9317@nyu.edu",
    "serviceAccount:${var.terraform_sa_name}@${var.project_id}.iam.gserviceaccount.com",
  ]
}


resource "google_project_iam_binding" "project-editor-role" {
  project = var.project_id
  role    = "roles/editor"

  members = [
    "serviceAccount:${var.dialect_map_deployment_sa_name}@${var.project_id}.iam.gserviceaccount.com",
  ]
}


resource "google_project_iam_binding" "project-viewer-role" {
  project = var.project_id
  role    = "roles/viewer"

  members = [
    "user:qmn203@nyu.edu",
    "serviceAccount:${var.dialect_map_diff_sa_name}@${var.project_id}.iam.gserviceaccount.com",
    "serviceAccount:${var.dialect_map_jobs_sa_name}@${var.project_id}.iam.gserviceaccount.com",
  ]
}


# List of advanced roles members

resource "google_project_iam_binding" "project-sa-key-admin-role" {
  project = var.project_id
  role    = "roles/iam.serviceAccountKeyAdmin"

  members = [
    "user:qmn203@nyu.edu",
  ]
}
