variable "name" {
  default     = ""
  description = "The display name for the service principal."
}

variable "password" {
  default     = ""
  description = "The Password for this Service Principal."
}

variable "end_date" {
  default     = ""
  description = "The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
}

variable "scope" {
  default     = ""
  description = "The scope at which the Role Assignment applies too."
}

variable "role" {
  default     = "Contributor"
  description = "The name of a built-in Role."
}

variable "years" {
  default     = 1
  description = "Number of years for which the password will be valid. Conflicts with `end_date`."
}
