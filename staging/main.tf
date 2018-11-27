module "staging" {
  source = "../infrastructure"

  environment_name = "staging"
  webapp_sku = "S2"
}
