locals {
  cis_v120_3_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "3"
  })
}

locals {
  cis_v120_3_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1"
  })
  cis_v120_3_1_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.2"
  })
  cis_v120_3_1_2_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.2.1"
  })
  cis_v120_3_1_2_1_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.2.1.1"
  })
  cis_v120_3_1_2_1_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.2.1.2"
  })
  cis_v120_3_1_3_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3"
  })
  cis_v120_3_1_3_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.1"
  })
  cis_v120_3_1_3_5_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.5"
  })
  cis_v120_3_1_6_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.6"
  })
}

benchmark "cis_v120_3" {
  title         = "3 Apps"
  documentation = file("./cis_v120/docs/cis_v120_3.md")
  children = [
    benchmark.cis_v120_3_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1" {
  title         = "3.1 Google Workspace"
  documentation = file("./cis_v120/docs/cis_v120_3_1.md")
  children = [
    benchmark.cis_v120_3_1_2,
    benchmark.cis_v120_3_1_3,
    benchmark.cis_v120_3_1_6
  ]

  tags = merge(local.cis_v120_3_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_2" {
  title         = "3.1.2 Drive and Docs"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2.md")
  children = [
    benchmark.cis_v120_3_1_2_1
  ]

  tags = merge(local.cis_v120_3_1_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_2_1" {
  title         = "3.1.2.1 Sharing Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1.md")
  children = [
    benchmark.cis_v120_3_1_2_1_1,
    benchmark.cis_v120_3_1_2_1_2
  ]

  tags = merge(local.cis_v120_3_1_2_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_2_1_1" {
  title         = "3.1.2.1.1 Sharing Options"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1.md")
  children = [
    control.cis_v120_3_1_2_1_1_3
  ]

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_3" {
  title         = "3.1.2.1.1.3 (L2) Ensure document sharing is being controlled by domain with allowlists"
  description   = "You should control sharing of documents to external domains by either blocking domains or only allowing sharing with specific named domains."
  query         = query.drive_domain_restriction
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_3.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Drive"
  })
}

benchmark "cis_v120_3_1_2_1_2" {
  title         = "3.1.2.1.2 Shared Drive Creation"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2.md")
  children = [
    control.cis_v120_3_1_2_1_2_3,
    control.cis_v120_3_1_2_1_2_4
  ]

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_2_3" {
  title         = "3.1.2.1.2.3 (L1) Ensure shared drive file access is restricted to members only"
  description   = "Shared drive file access should be restricted to that shared drive's members."
  query         = query.drive_members_only_access
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2_3.md")

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    cis_item_id = "3.1.2.1.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Drive"
  })
}

control "cis_v120_3_1_2_1_2_4" {
  title         = "3.1.2.1.2.4 (L2) Ensure viewers and commenters ability to download, print, and copy files is disabled"
  description   = "limit what viewers/commenters on a shared document can do with it."
  query         = query.drive_viewer_restrictions
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2_4.md")

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    cis_item_id = "3.1.2.1.2.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Drive"
  })
}

benchmark "cis_v120_3_1_3" {
  title         = "3.1.3 Gmail"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3.md")
  children = [
    benchmark.cis_v120_3_1_3_1,
    benchmark.cis_v120_3_1_3_5
  ]

  tags = merge(local.cis_v120_3_1_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_1" {
  title         = "3.1.3.1 User Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_1.md")
  children = [
    control.cis_v120_3_1_3_1_1
  ]

  tags = merge(local.cis_v120_3_1_3_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_1_1" {
  title         = "3.1.3.1.1 (L1) Ensure users cannot delegate access to their mailbox"
  description   = "Mail delegation allows the delegate to read, send, and delete messages on their behalf."
  query         = query.gmail_delegation_disabled
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_1_1.md")

  tags = merge(local.cis_v120_3_1_3_1_common_tags, {
    cis_item_id = "3.1.3.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Gmail"
  })
}

benchmark "cis_v120_3_1_3_5" {
  title         = "3.1.3.5 End User Access"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5.md")
  children = [
    control.cis_v120_3_1_3_5_1,
    control.cis_v120_3_1_3_5_2
  ]

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_5_1" {
  title         = "3.1.3.5.1 (L2) Ensure POP and IMAP access is disabled for all users"
  description   = "POP and IMAP may allow users to access Gmail using legacy or unapproved email clients that do not support modern authentication mechanisms, such as multifactor authentication."
  query         = query.gmail_pop_imap_disabled
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5_1.md")

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    cis_item_id = "3.1.3.5.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Gmail"
  })
}

control "cis_v120_3_1_3_5_2" {
  title         = "3.1.3.5.2 (L1) Ensure automatic forwarding options are disabled"
  description   = "You should disable automatic forwarding to prevent users from auto-forwarding mail."
  query         = query.gmail_auto_forwarding_disabled
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5_2.md")

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    cis_item_id = "3.1.3.5.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Gmail"
  })
}

benchmark "cis_v120_3_1_6" {
  title         = "3.1.6 Groups for Business"
  documentation = file("./cis_v120/docs/cis_v120_3_1_6.md")
  children = [
    control.cis_v120_3_1_6_2
  ]

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_6_2" {
  title         = "3.1.6.2 (L1) Ensure creating groups is restricted"
  description   = "Control who is allowed to create Groups in your organization and if they can have external members."
  query         = query.groups_admin_created_only
  documentation = file("./cis_v120/docs/cis_v120_3_1_6_2.md")

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    cis_item_id = "3.1.6.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Groups"
  })
}
