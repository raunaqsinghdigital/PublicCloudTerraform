# The configuration for the `remote` backend. U
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "privateorg"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "GitHub-PublicCloudTerraform"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.19"
    }
  }
}

provider "google" {
  credentials = var.credentials

  project = var.project
  region  = var.region
  zone    = var.zone
}