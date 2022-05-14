locals {
  project_name = "vm-tech-test"
  project_id = "vm-tech-test-${random_integer.int.result}"
  region = "europe-west2"
  secondary_ip_ranges = {
    "pod-ip-range"      = "10.0.0.0/14",
    "services-ip-range" = "10.4.0.0/19"
  }
  gke_num_nodes = 1
}

variable "billing_account" {
    type = string
    description = "The cloud billing account id associated with your google cloud account"
}

