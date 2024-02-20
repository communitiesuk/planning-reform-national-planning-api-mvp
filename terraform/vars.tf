variable "tags" {
  type = map
  description = "Tags to add to resources"
  default = {
    "department"  = "planning-reform"
    "team"        = "national-planning-api"
    "terraform"   = "true"
  }
}

variable "deletion_protection" {
  type = bool
  description = "Protect log file bucket"
  default = false
}

variable "expire_logs" {
  type = bool
  description = "Protect log file bucket"
  default = false
}
