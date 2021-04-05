terraform {
  backend "gcs" {
    bucket  = "terraform-sentry-health-sandbox"
    prefix  = "meet-backend-state"

    # Use this to set the containerized environment; cloudbuild not required
    # credentials = "/tf/terraform-credentials.json"
  }
}
