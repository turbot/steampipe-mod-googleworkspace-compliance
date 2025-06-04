locals {
  cis_v120_5_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "5"
  })
}

locals {
  cis_v120_5_1_common_tags = merge(local.cis_v120_5_common_tags, {
    cis_section_id = "5.1"
  })
  cis_v120_5_1_1_common_tags = merge(local.cis_v120_5_common_tags, {
    cis_section_id = "5.1.1"
  })
}

benchmark "cis_v120_5" {
  title         = "5 Reporting"
  documentation = file("./cis_v120/docs/cis_v120_5.md")
  children = [
    benchmark.cis_v120_5_1
  ]

  tags = merge(local.cis_v120_5_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_5_1" {
  title         = "5.1 Reports"
  documentation = file("./cis_v120/docs/cis_v120_5_1.md")
  children = [
    benchmark.cis_v120_5_1_1
  ]

  tags = merge(local.cis_v120_5_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_5_1_1" {
  title         = "5.1.1 User Reports"
  documentation = file("./cis_v120/docs/cis_v120_5_1_1.md")
  children = [
    control.cis_v120_5_1_1_1,
    control.cis_v120_5_1_1_2
  ]

  tags = merge(local.cis_v120_5_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_5_1_1_1" {
  title         = "5.1.1.1 (L1) Ensure the App Usage Report is reviewed regularly for anomalies"
  description   = "As an administrator, you can use Apps usage reports to get an in-depth understanding of how your users use Google Workspace apps."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_5_1_1_1.md")

  tags = merge(local.cis_v120_5_1_1_common_tags, {
    cis_item_id = "5.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_5_1_1_2" {
  title         = "5.1.1.2 (L1) Ensure the Security Report is reviewed regularly for anomalies"
  description   = "As your organization's administrator, you can monitor your users' exposure to data compromise by reviewing the security report."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_5_1_1_2.md")

  tags = merge(local.cis_v120_5_1_1_common_tags, {
    cis_item_id = "5.1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}
