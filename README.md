# Azure Active Directory Service Principal

Create an Azure Active Directory application and service principal that can access resources.

This module provisions the following resources:

- [`azurerm_azuread_application`](https://www.terraform.io/docs/providers/azurerm/r/azuread_application.html)
- [`azurerm_azuread_service_principal`](https://www.terraform.io/docs/providers/azurerm/r/azuread_service_principal.html)
- [`azurerm_azuread_service_principal_password`](https://www.terraform.io/docs/providers/azurerm/r/azuread_service_principal.html)
- [`azurerm_role_assignment`](https://www.terraform.io/docs/providers/azurerm/r/role_assignment.html)
- [`random_id`](https://www.terraform.io/docs/providers/random/r/id.html)
- [`random_string`](https://www.terraform.io/docs/providers/random/r/string.html)

**Note⚠️** If you're authenticating using a Service Principal then it must have permissions to both `Read` and `Write` all applications and `Sign in and read user profile` within the Windows Azure Active Directory API.

More information:

- [Integrating applications with Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications)
- [Use portal to create an Azure Active Directory application and service principal that can access resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
- [Create an Azure service principal with Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)
- [Built-in roles in Azure](https://docs.microsoft.com/en-gb/azure/role-based-access-control/built-in-roles)
- [Azure Provider: Authenticating using a Service Principal](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html)

## Usage

Example 1:

```hcl
module "service_principal" {
  source = "innovationnorway/service-principal/azurerm"
  end_date = "2020-01-01T01:02:03Z"
}

output "application_id" {
  value = "${module.service_principal.application_id}"
}

output "password" {
  value = "${module.service_principal.password}"
}
```

Example 2:

```hcl
module "service_principal" {
  source = "innovationnorway/service-principal/azurerm"
  years  = "2"
}

output "application_id" {
  value = "${module.service_principal.application_id}"
}

output "password" {
  value = "${module.service_principal.password}"
}
```

**Tip💡** You can create the same service principal with [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/) by using the following [az ad sp create-for-rbac](https://docs.microsoft.com/en-us/cli/azure/ad/sp#az-ad-sp-create-for-rbac) command: `az ad sp create-for-rbac --years 2`

## Inputs

### name

The display name for the service principal.

### end_date

The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. `2020-01-01T01:02:03Z`). Overrides `years`.

### password

The Password for this Service Principal.

### role

The name of a built-in Role. Default is `Contributor`.

### scope

The scope at which the Role Assignment applies too. Default is current subscription.

### skip_assignment

Do not create role assignment. Default is `false`.

### years

Number of years for which the password will be valid. Default is `1`.

**Note⚠️** If `years` is specified then `end_date` changes on every invocation of `terraform plan` and `terraform apply`.

## Outputs

### application_id

The Application ID.

### display_name

The Display Name of the Azure Active Directory Application associated with this Service Principal.

### end_date

The End Date which the Password is valid until.

### key_id

The Key ID for the Service Principal Password.

### object_id

The Object ID for the Service Principal.

### password

The Password for this Service Principal.

### role_assignment_id

The Role Assignment ID.
