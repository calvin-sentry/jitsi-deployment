# # data "google_compute_default_service_account" "default" {
# # }

# resource "google_service_account" "default" {
#   account_id   = "meet-engine"
#   display_name = "Meet Engine Service Account"
# }

# data "google_iam_policy" "storage_admin" {
#   binding {
#     role = "roles/storage.objectAdmin"

#     members = [
#       "serviceAccount:${google_service_account.default.email}"
#     ]
#   }
# }

# resource "google_service_account_iam_policy" "admin-account-iam" {
#   service_account_id = google_service_account.default.id
#   policy_data        = data.google_iam_policy.storage_admin.policy_data
# }

# resource "google_container_cluster" "primary" {
#   name     = "meet-cluster"
#   location = var.zone

#   enable_shielded_nodes = true
#   # We can't create a cluster with no node pool defined, but we want to only use
#   # separately managed node pools. So we create the smallest possible default
#   # node pool and immediately delete it.
#   remove_default_node_pool = true
#   initial_node_count       = 1
# }

# resource "google_container_node_pool" "nodes" {
#   name       = "meet-pool"
#   location   = var.zone
#   cluster    = google_container_cluster.primary.name
#   node_count = 1
  
#   autoscaling {
#     min_node_count = 0
#     max_node_count = 2
#   }

#   node_config {
#     preemptible  = false
#     machine_type = "e2-standard-4"

#     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
# #    service_account = google_service_account.default.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }