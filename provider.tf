locals {
  # GCP
  gcp_region = "asia-northeast1"

}

provider "google" {
  project = var.gcp_project_id
  region  = local.gcp_region
}
