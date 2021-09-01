locals {
  cis_v100_common_tags = {
    benchmark   = "cis"
    cis_version = "v1.0.0"
    plugin      = "googleworkspace"
  }
}

benchmark "cis_v100" {
  title         = "CIS v1.0.0"
  description   = "The CIS Google Workspace Foundations Benchmark provides prescriptive guidance for establishing a secure configuration posture for Google Workspace."
  documentation = file("./cis_v100/docs/cis_overview.md")
  tags          = local.cis_v100_common_tags
  children = [
    benchmark.cis_v100_1,
    benchmark.cis_v100_5
  ]
}