locals {
  googleworkspace_compliance_common_tags = {
    category = "Compliance"
    plugin   = "googleworkspace"
    service  = "Google Workspace"
  }
} 


variable "database" {
  type        = connection.steampipe
  description = "Steampipe database connection string."
  default     = connection.steampipe.default
}