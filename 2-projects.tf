# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project

resource "google_project" "vm_tech_test_project" {
    name = local.project_name
    project_id = local.project_id
    billing_account = var.billing_account
    auto_create_network = false
}