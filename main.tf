provider "azurerm" {
  # this should be bumped to 1.12.0 when it's released
  version = "~> 1.11.0"
}

provider "random" {
  version = "~> 1.3"
}

data "azurerm_subscription" "current" {}

locals {
  default_end_date = "${timeadd(timestamp(), "${var.years * 365}h")}"
  end_date         = "${var.end_date != "" ? var.end_date : local.default_end_date}"
  name             = "${var.name != "" ? var.name : random_id.default_name.hex}"
  password         = "${var.password != "" ? var.password : random_string.default_password.result}"
  scope            = "${var.scope != "" ? var.scope : data.azurerm_subscription.current.id}"
}

resource "random_string" "default_password" {
  length = 32
}

resource "random_id" "default_name" {
  byte_length = 16
  prefix      = "terraform"
}

resource "azurerm_azuread_application" "service_principal" {
  name                       = "${local.name}"
  available_to_other_tenants = false
}

resource "azurerm_azuread_service_principal" "service_principal" {
  application_id = "${azurerm_azuread_application.service_principal.application_id}"
}

resource "azurerm_azuread_service_principal_password" "service_principal" {
  service_principal_id = "${azurerm_azuread_service_principal.service_principal.id}"
  value                = "${local.password}"
  end_date             = "${local.end_date}"
}

resource "azurerm_role_assignment" "service_principal" {
  scope                = "${local.scope}"
  role_definition_name = "${var.role}"
  principal_id         = "${azurerm_azuread_service_principal.service_principal.id}"
}
