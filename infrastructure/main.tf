provider "azurerm" {}

locals {
  default_tags = {
    environment = "${var.environment_name}"
    author      = "Thorsten Hans"
  }

  all_tags = "${merge(local.default_tags, var.custom_tags)}"
}

resource "azurerm_resource_group" "demo" {
  location = "West Europe"
  name     = "thh-espc-${var.environment_name}"

  tags = "${local.all_tags}"
}

resource "azurerm_app_service_plan" "webapp_plan" {
  location            = "${azurerm_resource_group.demo.location}"
  resource_group_name = "${azurerm_resource_group.demo.name}"
  name                = "app_svc_plan_webapp_${var.environment_name}"
  kind                = "linux"

  sku {
    tier = "Standard"
    size = "${var.webapp_sku}"
  }

  properties {
    reserved = true
  }

  tags = "${local.all_tags}"
}

resource "azurerm_app_service" "webapp" {
  location            = "${azurerm_resource_group.demo.location}"
  resource_group_name = "${azurerm_resource_group.demo.name}"
  app_service_plan_id = "${azurerm_app_service_plan.webapp_plan.id}"
  name                = "thh-espc-webapp-${var.environment_name}"
  tags                = "${local.all_tags}"

  identity {
    type = "SystemAssigned"
  }

  app_settings {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }

  site_config {
    always_on        = true
    linux_fx_version = "DOCKER|nginx:alpine"
  }
}

resource "azurerm_managed_disk" "disk" {
  location             = "${azurerm_resource_group.demo.location}"
  resource_group_name  = "${azurerm_resource_group.demo.name}"
  name                 = "thh-espc-disk-${var.environment_name}"
  count                = "${var.deploy_disk}"
  disk_size_gb         = "8"
  tags                 = "${local.all_tags}"
  create_option        = "empty"
  storage_account_type = "Standard_LRS"
}
