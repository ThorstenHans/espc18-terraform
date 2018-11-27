module "production" {
  source = "../infrastructure"

  environment_name = "production"
  webapp_sku       = "S2"
  deploy_disk      = true

  custom_tags {
    hot = "yes"
  }
}
