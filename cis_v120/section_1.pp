locals {
  cis_v120_1_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "1"
  })
}

locals {
  cis_v120_1_1_common_tags = merge(local.cis_v120_1_common_tags, {
    cis_section_id = "1.1"
  })
  cis_v120_1_2_common_tags = merge(local.cis_v120_1_common_tags, {
    cis_section_id = "1.2"
  })
  cis_v120_1_2_1_common_tags = merge(local.cis_v120_1_common_tags, {
    cis_section_id = "1.2.1"
  })
}

benchmark "cis_v120_1" {
  title         = "1 Directory"
  documentation = file("./cis_v120/docs/cis_v120_1.md")
  children = [
    benchmark.cis_v120_1_1,
    benchmark.cis_v120_1_2
  ]

  tags = merge(local.cis_v120_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_1_1" {
  title         = "1.1 Users"
  documentation = file("./cis_v120/docs/cis_v120_1_1.md")
  children = [
    control.cis_v120_1_1_1,
    control.cis_v120_1_1_2,
    control.cis_v120_1_1_3
  ]

  tags = merge(local.cis_v120_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_1_1_1" {
  title         = "1.1.1 (L1) Ensure more than one Super Admin account exists"
  description   = "Having more than one Super Admin account is needed primarily so that a single point of failure can be avoided."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_1_1.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_1_1_2" {
  title         = "1.1.2 (L1) Ensure no more than 4 Super Admin accounts exist"
  description   = "Having more than one Super Admin account is needed primarily so that a single point of failure can be avoided, but having too many should be avoided."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_1_2.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_1_1_3" {
  title         = "1.1.3 (L1) Ensure super admin accounts are used only for super admin activities"
  description   = "Super admin accounts have access to all features in the Google Admin console and Admin API and can manage every aspect of your organization's account."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_1_3.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_1_2" {
  title         = "1.2 Directory Settings"
  documentation = file("./cis_v120/docs/cis_v120_1_2.md")
  children = [
    benchmark.cis_v120_1_2_1
  ]

  tags = merge(local.cis_v120_1_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_1_2_1" {
  title         = "1.2.1 Sharing Settings"
  documentation = file("./cis_v120/docs/cis_v120_1_2_1.md")
  children = [
    control.cis_v120_1_2_1_1
  ]

  tags = merge(local.cis_v120_1_2_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_1_2_1_1" {
  title         = "1.2.1.1 (L1) Ensure directory data access is externally restricted"
  description   = "Configure Google Workspace's external directory sharing to prevent unrestricted directory data access."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_2_1_1.md")

  tags = merge(local.cis_v120_1_2_1_common_tags, {
    cis_item_id = "1.2.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}
