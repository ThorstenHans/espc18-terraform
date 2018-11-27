variable "environment_name" {
  type        = "string"
  description = "provide a identifier for your environment"
}

variable "custom_tags" {
  type        = "map"
  description = "Custom tags that should be applied to every resource"
  default     = {}
}

variable "webapp_sku" {
  type        = "string"
  description = "WebApp's SKU"

  default = "S2"
}

variable "deploy_disk" {
  type    = "string"
  default = false
}
