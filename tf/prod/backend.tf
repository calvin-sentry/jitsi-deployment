terraform {
  backend "gcs" {
    bucket  = "terraform-sentry-health-sandbox"
    prefix  = "k8s-backend-state"

    # Use this to set the containerized environment; cloudbuild not required
    # credentials = "/tf/terraform-credentials.json"
  }
}
