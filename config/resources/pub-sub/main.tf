# Enables the API to manage resources

resource "google_project_service" "pubsub-api" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}


# Variables to use in the file

locals {
  diff_sa = "${var.dialect_map_diff_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  jobs_sa = "${var.dialect_map_jobs_sa_name}@${var.project_id}.iam.gserviceaccount.com"
}


# List of resources associated to the module

resource "google_pubsub_topic" "data-diff-topic" {
  name = "data-diff"

  labels = {
    env : "production"
  }
}


resource "google_pubsub_subscription" "data-diff-static-sub" {
  name  = "static-data-job"
  topic = google_pubsub_topic.data-diff-topic.name

  labels = {
    env : "production"
    job : "static-data"
  }

  # Maximum number of seconds to ACK a message
  ack_deadline_seconds = 600

  # Whether to preserve messages in a backlog
  retain_acked_messages = false

  # Subscription expiration (empty TTL means never)
  expiration_policy {
    ttl = ""
  }
}


# List of Pub/Sub permission roles

resource "google_pubsub_topic_iam_binding" "diff-topic-publisher-binding" {
  project = var.project_id
  topic   = google_pubsub_topic.data-diff-topic.name
  role    = "roles/pubsub.publisher"

  members = [
    "serviceAccount:${local.diff_sa}",
  ]
}


resource "google_pubsub_subscription_iam_binding" "static-subscription-binding" {
  subscription = google_pubsub_subscription.data-diff-static-sub.name
  role         = "roles/pubsub.subscriber"

  members = [
    "serviceAccount:${local.jobs_sa}",
  ]
}
