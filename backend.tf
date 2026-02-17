terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ramantandon"

    workspaces {
      name = "gcp-project-03"
    }
  }
}
