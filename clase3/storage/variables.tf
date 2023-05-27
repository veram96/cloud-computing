variable "gcp_project" {
  type     = string
  nullable = false
}

variable "gcp_zone" {
  type     = string
  nullable = false
}

variable "gcp_region" {
  type     = string
  nullable = false
}

variable "name_prefix" {
  type     = string
  nullable = false
}

variable "users_list" {
  type     = list(string)
  nullable = false
}
