# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "nat"{
    name = "nat"
    router = google_compute_router.router.name
    region = local.region

    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    nat_ip_allocate_option = "AUTO_ONLY"

    subnetwork {
      name = google_compute_subnetwork.vm_private_subnet.id
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
}