output "application_id" {
  description = "The Application ID."
  value       = "${azurerm_azuread_application.service_principal.application_id}"
}

output "display_name" {
  description = "The Display Name of the Azure Active Directory Application associated with this Service Principal."
  value       = "${azurerm_azuread_service_principal.service_principal.display_name}"
}

output "end_date" {
  description = "The End Date which the Password is valid until."
  value       = "${azurerm_azuread_service_principal_password.service_principal.end_date}"
}

output "key_id" {
  description = "The Key ID for the Service Principal Password."
  value       = "${azurerm_azuread_service_principal_password.service_principal.id}"
}

output "object_id" {
  description = "The Object ID for the Service Principal."
  value       = "${azurerm_azuread_service_principal.service_principal.id}"
}

output "password" {
  description = "The Password for this Service Principal."
  value       = "${azurerm_azuread_service_principal_password.service_principal.value}"
  sensitive   = true
}

output "role_assignment_id" {
  description = "The Role Assignment ID."
  value       = "${azurerm_role_assignment.service_principal.0.id}"
}
