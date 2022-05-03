locals {
  project_name = "vm-tech-test"
  project_id = "vm-tech-test-${random_integer.int.result}"
  region = "europe-west1"
  secondary_ip_ranges = {
    "pod-ip-range"      = "10.0.0.0/14",
    "services-ip-range" = "10.4.0.0/19"
  }
  gke_num_nodes = 3
}

var billing_account{
  description = "The cloud billing account id associated with your google cloud account"
}

