variable "name" {
  default     = ""
  description = "The display name for the service principal."
}

variable "end_date" {
  default     = ""
  description = "The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. `2020-01-01T01:02:03Z`). Overrides `years`."
}

variable "password" {
  default     = ""
  description = "The Password for this Service Principal."
}

variable "years" {
  default     = 1
  description = "Number of years for which the password will be valid."
}

variable "skip_assignment" {
  default     = false
  description = "Do not create role assignment."
}

variable "start_date" {
  default     = ""
  description = "The Start Date which the Password is valid from, formatted as a RFC3339 date string (e.g. `2020-01-01T01:02:03Z`)."
}

variable "role" {
  default     = "Contributor"
  description = "The name of a built-in Role."
}

variable "scope" {
  default     = ""
  description = "The scope at which the Role Assignment applies too, such as such as `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup`."
}
