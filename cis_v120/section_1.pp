locals {
  cis_v120_1_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "1"
  })
}

locals {
  cis_v120_1_1_common_tags = merge(local.cis_v120_1_common_tags, {
    cis_section_id = "1.1"
  })
}

benchmark "cis_v120_1" {
  title         = "1 Directory"
  documentation = file("./cis_v120/docs/cis_v120_1.md")
  children = [
    benchmark.cis_v120_1_1
  ]

  tags = merge(local.cis_v120_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/Directory"
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
    service = "GoogleWorkspace/Directory"
  })
}

control "cis_v120_1_1_1" {
  title         = "1.1.1 (L1) Ensure more than one Super Admin account exists"
  description   = "Having more than one Super Admin account is needed primarily so that a single point of failure can be avoided."
  query         = query.admin_super_admin_count
  documentation = file("./cis_v120/docs/cis_v120_1_1_1.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Directory"
  })
}

control "cis_v120_1_1_2" {
  title         = "1.1.2 (L1) Ensure no more than 4 Super Admin accounts exist"
  description   = "Having more than one Super Admin account is needed primarily so that a single point of failure can be avoided, but having too many should be avoided."
  query         = query.admin_super_admin_max_count
  documentation = file("./cis_v120/docs/cis_v120_1_1_2.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Directory"
  })
}

control "cis_v120_1_1_3" {
  title         = "1.1.3 (L1) Ensure super admin accounts are used only for super admin activities"
  description   = "Super admin accounts have access to all features in the Google Admin console and Admin API and can manage every aspect of your organization's account."
  query         = query.admin_super_admin_dedicated
  documentation = file("./cis_v120/docs/cis_v120_1_1_3.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Directory"
  })
}
