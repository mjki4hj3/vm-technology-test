# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "scalable_node_pool" {
  name       = "${local.project_name}-scalable-node-pool"
  location   = local.region
  cluster    = google_container_cluster.primary.name
  node_count = 0

  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible = true
    machine_type = "e2-small"
    service_account = google_service_account.vm_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "non_scalable_node_pool" {
  name       = "${local.project_name}-nonscalable-node-pool"
  location   = local.region
  cluster    = google_container_cluster.primary.name
  node_count = local.gke_num_nodes

  node_config {
    service_account = google_service_account.vm_sa.email
    oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
    ]

    machine_type = "e2-small"

  }
}