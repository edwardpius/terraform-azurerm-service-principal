data "azurerm_subscription" "current" {}

resource "random_string" "password" {
  length = 32
}

resource "random_id" "name" {
  byte_length = 16
  prefix      = "terraform"
}

resource "azurerm_azuread_application" "service_principal" {
  name = "${coalesce(var.name, random_id.name.hex)}"
}

resource "azurerm_azuread_service_principal" "service_principal" {
  application_id = "${azurerm_azuread_application.service_principal.application_id}"
}

resource "azurerm_azuread_service_principal_password" "service_principal" {
  service_principal_id = "${azurerm_azuread_service_principal.service_principal.id}"
  value                = "${coalesce(var.password, random_string.password.result)}"
  end_date             = "${coalesce(var.end_date, timeadd(timestamp(), "${var.years * (24 * 365)}h"))}"
}

resource "azurerm_role_assignment" "service_principal" {
  count                = "${var.skip_assignment ? 0 : 1}"
  scope                = "${coalesce(var.scope, data.azurerm_subscription.current.id)}"
  role_definition_name = "${var.role}"
  principal_id         = "${azurerm_azuread_service_principal.service_principal.id}"
}
