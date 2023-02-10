resource "google_compute_network" "vpc_network" {
  name                    = "postgres-demo-network"
  auto_create_subnetworks = "false"
}

module "vpc" {
  source  = "terraform-google-modules/network/google//modules/subnets"
  version = ">= 4.0"

  project_id   = var.project
  network_name = "postgres-demo-network"
  depends_on   = [google_compute_network.vpc_network]
  subnets = [
    {
      subnet_name   = "subnet-postgre-demo"
      subnet_ip     = "10.2.0.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "subnet-postgre-compute-demo"
      subnet_ip     = "10.2.1.0/24"
      subnet_region = "us-central1"

    }
  ]

}
