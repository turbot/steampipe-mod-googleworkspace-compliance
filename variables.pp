variable "common_dimensions" {
  type        = list(string)
  description = "A list of common dimensions to add to each control."
  default     = ["organization_id", "customer_id"]
}

variable "tag_dimensions" {
  type        = list(string)
  description = "A list of tags to add as dimensions to each control."
  default     = []
}

locals {
  # Common tags for CIS v1.2.0 benchmarks
  cis_v120_common_tags = {
    cis         = "true"
    cis_version = "v1.2.0"
    plugin      = "googleworkspace"
  }
} 