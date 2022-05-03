# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "vm_private_subnet" {
    name = "${local.project_id}-private-subnet"
    region = local.region
    network = google_compute_network.vm_custom_vpc.id
    ip_cidr_range = "10.5.0.0/20"
    private_ip_google_access = true


    dynamic "secondary_ip_range" {
        for_each = local.secondary_ip_ranges

        content {
            range_name = secondary_ip_range.key
            ip_cidr_range = secondary_ip_range.value
        }
    }
}
