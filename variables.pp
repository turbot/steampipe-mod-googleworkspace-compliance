locals {
  # Common tags for CIS v1.2.0 benchmarks
  cis_v120_common_tags = {
    cis         = "true"
    cis_version = "v1.2.0"
    plugin      = "googleworkspace"
  }
} 