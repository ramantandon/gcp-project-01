module "vpc_network" {
  source  = "terraform-google-modules/network/google"
  version = "15.0.0"

  # insert the 3 required variables here
  network_name = var.network_name
  project_id   = google_project.project.project_id
  subnets = [
    {
      subnet_name           = "subnet-us-east1"
      subnet_region         = "us-east1"
      subnet_ip             = "10.142.0.0/20"
      subnet_private_access = "true"
    },
    {
      subnet_name           = "subnet-us-east4"
      subnet_region         = "us-east4"
      subnet_ip             = "10.144.0.0/20"
      subnet_private_access = "true"
    }
  ]

  # Optional Inputs
  # auto_create_subnetworks = false
  routing_mode = "GLOBAL" # default is GLOBAL
  /* routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
    ] */
}

/* resource "google_compute_network" "vpc-1" {
  name                    = "vpc-1"
  auto_create_subnetworks = false
  project                 = google_project.project.project_id
  timeouts {
    create = "15m"
    delete = "15m"
  }

resource "google_compute_subnetwork" "subnet-us-east4" {
  name          = "subnet-us-east4"
  ip_cidr_range = "10.3.0.0/16"
  project       = google_project.project.project_id
  region        = "us-east4"
  network       = google_compute_network.vpc-1.id
  timeouts {
    create = "15m"
    delete = "15m"
  }
} */