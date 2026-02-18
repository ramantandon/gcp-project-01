variable "project" {
  type = string
  description = "Project Name"
  default     = "gcp-project-01"
}

variable "billing-account-id" {
  type = string
  description = "Associated billing account ID"
  default     = "019CEB-EDACA8-54AEA2"
}

variable "region" {
  type = string
  description = "Default Region"
  default     = "us-central1"
}

variable "network_name" {
  type        = string
  description = "VPC Name"
  default     = "vpc"
}

/* 
locals {
  # Admins
  gcp_admins = [
    "serviceAccount:terraform@rtandon-ak-myproject-2021-12.iam.gserviceaccount.com",
  ]
}
*/
