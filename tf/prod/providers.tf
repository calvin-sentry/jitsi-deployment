provider "google" {
  # credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  # credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

data "google_client_config" "default" {
}

data "google_container_cluster" "autopilot" {
  name     = "sentry-ap-cluster"
  location = var.region
}

# The Kubernetes Provider
provider "kubernetes" {
  # load_config_file = false

  host  = "https://${data.google_container_cluster.autopilot.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.autopilot.master_auth[0].cluster_ca_certificate,
  )

}

# The Helm provider
provider helm {
  kubernetes {
    # load_config_file = false

    host  = "https://${data.google_container_cluster.autopilot.endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.autopilot.master_auth[0].cluster_ca_certificate,
    )
  }
}

# The Null Provider
provider null {}
