locals {
  cis_v120_4_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_v120_4_1_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.1"
  })
  cis_v120_4_1_1_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.1.1"
  })
}

benchmark "cis_v120_4" {
  title         = "4 Security"
  documentation = file("./cis_v120/docs/cis_v120_4.md")
  children = [
    benchmark.cis_v120_4_1
  ]

  tags = merge(local.cis_v120_4_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/SecurityCenter"
  })
}

benchmark "cis_v120_4_1" {
  title         = "4.1 Authentication"
  documentation = file("./cis_v120/docs/cis_v120_4_1.md")
  children = [
    benchmark.cis_v120_4_1_1
  ]

  tags = merge(local.cis_v120_4_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_1_1" {
  title         = "4.1.1 2-Step Verification"
  documentation = file("./cis_v120/docs/cis_v120_4_1_1.md")
  children = [
    control.cis_v120_4_1_1_1,
    control.cis_v120_4_1_1_3
  ]

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_1_1" {
  title         = "4.1.1.1 (L1) Ensure 2-Step Verification (Multi-Factor Authentication) is enforced for all users in administrative roles"
  description   = "Enforce 2-Step Verification (Multi-Factor Authentication) for all users assigned administrative roles."
  query         = query.directory_user_admin_2fa_enrolled
  documentation = file("./cis_v120/docs/cis_v120_4_1_1_1.md")

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    cis_item_id = "4.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_1_3" {
  title         = "4.1.1.3 (L1) Ensure 2-Step Verification (Multi-Factor Authentication) is enforced for all users"
  description   = "Enforce 2-Step Verification (Multi-Factor Authentication) for all users."
  query         = query.directory_user_2fa_enrolled
  documentation = file("./cis_v120/docs/cis_v120_4_1_1_3.md")

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    cis_item_id = "4.1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
} 