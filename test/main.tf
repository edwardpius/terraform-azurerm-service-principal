module "service_principal" {
  source   = "../"
  end_date = "2020-07-21T23:59:00Z"
}

output "display_name" {
  value = "${module.service_principal.display_name}"
}

output "application_id" {
  value = "${module.service_principal.application_id}"
}

output "object_id" {
  value = "${module.service_principal.object_id}"
}

output "end_date" {
  value = "${module.service_principal.end_date}"
}
