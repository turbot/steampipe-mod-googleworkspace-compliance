benchmark "cis_v120" {
  title         = "CIS v1.2.0"
  description   = "The CIS Google Workspace Foundations Benchmark provides the prescriptive guidance for establishing a secure configuration posture for CIS Google Workspace Foundations Benchmark v1.2.0."
  documentation = file("./cis_v120/docs/cis_overview.md")
  children = [
    benchmark.cis_v120_1,
    benchmark.cis_v120_3,
    benchmark.cis_v120_4,
    benchmark.cis_v120_5,
    benchmark.cis_v120_6
  ]

  tags = merge(local.cis_v120_common_tags, {
    type = "Benchmark"
  })
}
