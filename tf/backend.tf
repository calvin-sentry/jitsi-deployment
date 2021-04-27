terraform {
  backend "gcs" {
    bucket  = "terraform-sentry-health-meet"
    prefix  = "proto-cluster-state"

    # Use this to set the containerized environment
    credentials = "/tf/terraform-credentials.json"
  }
}