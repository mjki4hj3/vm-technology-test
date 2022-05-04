# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "vm_sa" {
  account_id   = "vm-service-account-id"
  display_name = "VM tech test service account"

  depends_on = [
    google_project_service.compute
  ]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "primary" {
  name     = "${local.project_id}-gke"
  location = local.region
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  initial_node_count       = 1
  remove_default_node_pool = true

  network    = google_compute_network.vm_custom_vpc.name
  subnetwork = google_compute_subnetwork.vm_private_subnet.name

  #Uses alias IP address ranges
  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name = "pod-ip-range"
    services_secondary_range_name = "services-ip-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

