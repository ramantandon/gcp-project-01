resource "random_id" "project_id" {
  byte_length = 3
}

locals {
  project = "${var.project}-${random_id.project_id.hex}"
}

resource "google_project" "project" {
  name                = var.project
  project_id          = local.project
  billing_account     = var.billing-account-id
  auto_create_network = "false"
  lifecycle {
    prevent_destroy = false
  }
  labels = {
    business_unit = "ramantandon"
  }
}