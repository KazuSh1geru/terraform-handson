resource "google_bigquery_dataset" "test_ldb_bigquery" {
  dataset_id                 = "test_<名前を変えてみよう>"
  delete_contents_on_destroy = false
  location                   = local.gcp_region
  project                    = var.gcp_project_id
}

resource "google_bigquery_table" "first_view" {
  dataset_id          = google_bigquery_dataset.test_ldb_bigquery.dataset_id
  table_id            = "first_view"
  project             = var.gcp_project_id
  deletion_protection = false
  view {
    query          = "SELECT 1 as test"
    use_legacy_sql = false
  }
}

# resource "google_bigquery_table" "second_view" {
#   dataset_id          = google_bigquery_dataset.test_ldb_bigquery.dataset_id
#   table_id            = "second_view"
#   project             = var.gcp_project_id
#   deletion_protection = false
#   view {
#     query          = "SELECT test from `${var.gcp_project_id}.${google_bigquery_dataset.test_ldb_bigquery.dataset_id}.${google_bigquery_table.first_view.table_id}`"
#     use_legacy_sql = false
#   }
# }