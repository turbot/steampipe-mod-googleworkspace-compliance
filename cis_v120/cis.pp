benchmark "cis_v120" {
  title         = "CIS v1.2.0"
  description   = "The CIS Google Workspace Foundations Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Google Workspace."
  documentation = file("./cis_v120/docs/cis_overview.md")
  children = [
    benchmark.cis_v120_1, # Directory
    benchmark.cis_v120_2, # Devices
    benchmark.cis_v120_3, # Apps
    benchmark.cis_v120_4, # Security
  ]
} 