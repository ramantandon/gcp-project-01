resource "random_id" "project_id" {
  byte_length = 3
}

resource "google_project" "project" {
  name                = var.project
  project_id          = "${var.project}-${random_id.project_id.hex}"
  billing_account     = var.billing-account-id
  auto_create_network = "false"
  lifecycle {
    prevent_destroy = false
  }
  labels = {
    business_unit = "ramantandon"
  }
}