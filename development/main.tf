module "infra" {
  source = "../infrastructure"

  environment_name = "development"
  webapp_sku = "S1"
}
