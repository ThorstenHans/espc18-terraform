output "resource_group_id" {
  value = "${azurerm_resource_group.demo.id}"
}


output "webapp_fqn" {
  value = "${azurerm_app_service.webapp.default_site_hostname}"
}
