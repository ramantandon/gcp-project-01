resource "google_compute_instance" "instance-1" {
  name                      = "instance-1"
  machine_type              = "e2-medium"
  project                   = local.project
  zone                      = "us-east1-b"
  tags                      = ["allow-ssh"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2510-amd64"
    }
  }

  network_interface {
    # Reference the 'self_link' from the specific subnet in the module output
    subnetwork = module.vpc_network.subnets["us-east1/subnet-us-east1"].self_link

    access_config {
      // Ephemeral IP
    }
  }
  service_account {
    scopes = ["cloud-platform"]
  }
}

# resource "google_compute_instance" "instance-2" {
#   name                      = "instance-2"
#   machine_type              = "e2-medium"
#   project                   = local.project
#   zone                      = "us-east1-b"
#   tags                      = ["allow-ssh"]
#   allow_stopping_for_update = true

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-minimal-2510-amd64"
#     }
#   }

#   network_interface {
#     # Reference the 'self_link' from the specific subnet in the module output
#     subnetwork = module.vpc_network.subnets["us-east1/subnet-us-east1"].self_link

#     access_config {
#       // Ephemeral IP
#     }
#   }
#   service_account {
#     scopes = ["cloud-platform"]
#   }
# }