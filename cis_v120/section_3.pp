locals {
  cis_v120_3_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "3"
  })
}

locals {
  cis_v120_3_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1"
  })
  cis_v120_3_1_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.1"
  })
  cis_v120_3_1_1_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.1.1"
  })
  cis_v120_3_1_1_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.1.2"
  })
  cis_v120_3_1_1_3_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.1.3"
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
  cis_v120_3_1_2_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.2.2"
  })
  cis_v120_3_1_3_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3"
  })
  cis_v120_3_1_3_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.1"
  })
  cis_v120_3_1_3_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.2"
  })
  cis_v120_3_1_3_3_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.3"
  })
  cis_v120_3_1_3_4_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.4"
  })
  cis_v120_3_1_3_4_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.4.1"
  })
  cis_v120_3_1_3_4_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.4.2"
  })
  cis_v120_3_1_3_4_3_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.4.3"
  })
  cis_v120_3_1_3_5_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.5"
  })
  cis_v120_3_1_3_6_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.6"
  })
  cis_v120_3_1_3_7_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.3.7"
  })
  cis_v120_3_1_4_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.4"
  })
  cis_v120_3_1_4_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.4.1"
  })
  cis_v120_3_1_4_2_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.4.2"
  })
  cis_v120_3_1_4_3_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.4.3"
  })
  cis_v120_3_1_4_4_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.4.4"
  })
  cis_v120_3_1_6_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.6"
  })
  cis_v120_3_1_7_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.7"
  })
  cis_v120_3_1_8_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.8"
  })
  cis_v120_3_1_9_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.9"
  })
  cis_v120_3_1_9_1_common_tags = merge(local.cis_v120_3_common_tags, {
    cis_section_id = "3.1.9.1"
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
    benchmark.cis_v120_3_1_1,
    benchmark.cis_v120_3_1_2,
    benchmark.cis_v120_3_1_3,
    benchmark.cis_v120_3_1_4,
    benchmark.cis_v120_3_1_6,
    benchmark.cis_v120_3_1_7,
    benchmark.cis_v120_3_1_8,
    benchmark.cis_v120_3_1_9
  ]

  tags = merge(local.cis_v120_3_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_1" {
  title         = "3.1.1 Calendar"
  documentation = file("./cis_v120/docs/cis_v120_3_1_1.md")
  children = [
    benchmark.cis_v120_3_1_1_1,
    benchmark.cis_v120_3_1_1_2,
    benchmark.cis_v120_3_1_1_3
  ]

  tags = merge(local.cis_v120_3_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_1_1" {
  title         = "3.1.1.1 Sharing Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_1.md")
  children = [
    control.cis_v120_3_1_1_1_1,
    control.cis_v120_3_1_1_1_2,
    control.cis_v120_3_1_1_1_3
  ]

  tags = merge(local.cis_v120_3_1_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_1_1_1" {
  title         = "3.1.1.1.1 (L1) Ensure external sharing options for primary calendars are configured"
  description   = "Control how much calendar information users in your organization can share externally."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_1_1.md")

  tags = merge(local.cis_v120_3_1_1_1_common_tags, {
    cis_item_id = "3.1.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_1_1_2" {
  title         = "3.1.1.1.2 (L2) Ensure internal sharing options for primary calendars are configured"
  description   = "Control how much calendar information users in your organization can share internally."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_1_2.md")

  tags = merge(local.cis_v120_3_1_1_1_common_tags, {
    cis_item_id = "3.1.1.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_1_1_3" {
  title         = "3.1.1.1.3 (L1) Ensure external invitation warnings for Google Calendar are configured"
  description   = "Configure Google Calendar to warn users when inviting guest outside your domain."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_1_3.md")

  tags = merge(local.cis_v120_3_1_1_1_common_tags, {
    cis_item_id = "3.1.1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_1_2" {
  title         = "3.1.1.2 General Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_2.md")
  children = [
    control.cis_v120_3_1_1_2_1,
    control.cis_v120_3_1_1_2_2
  ]

  tags = merge(local.cis_v120_3_1_1_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_1_2_1" {
  title         = "3.1.1.2.1 (L1) Ensure external sharing options for secondary calendars are configured"
  description   = "Control how much calendar information users in your organization can share externally."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_2_1.md")

  tags = merge(local.cis_v120_3_1_1_2_common_tags, {
    cis_item_id = "3.1.1.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_1_2_2" {
  title         = "3.1.1.2.2 (L2) Ensure internal sharing options for secondary calendars are configured"
  description   = "Control how much calendar information users in your organization can share internally."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_2_2.md")

  tags = merge(local.cis_v120_3_1_1_2_common_tags, {
    cis_item_id = "3.1.1.2.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_1_3" {
  title         = "3.1.1.3 Advanced Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_3.md")
  children = [
    control.cis_v120_3_1_1_3_1
  ]

  tags = merge(local.cis_v120_3_1_1_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_1_3_1" {
  title         = "3.1.1.3.1 (L2) Ensure calendar web offline is disabled"
  description   = "Limit who is allowed offline calendar access."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_1_3_1.md")

  tags = merge(local.cis_v120_3_1_1_3_common_tags, {
    cis_item_id = "3.1.1.3.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}


benchmark "cis_v120_3_1_2" {
  title         = "3.1.2 Drive and Docs"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2.md")
  children = [
    benchmark.cis_v120_3_1_2_1,
    benchmark.cis_v120_3_1_2_2
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
    control.cis_v120_3_1_2_1_1_1,
    control.cis_v120_3_1_2_1_1_2,
    control.cis_v120_3_1_2_1_1_3,
    control.cis_v120_3_1_2_1_1_4,
    control.cis_v120_3_1_2_1_1_5,
    control.cis_v120_3_1_2_1_1_6
  ]

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_1" {
  title         = "3.1.2.1.1.1 (L1) Ensure users are warned when they share a file outside their domain"
  description   = "Warn the user when they try and share a file and/or shared drive externally."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_1.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_2" {
  title         = "3.1.2.1.1.2 (L1) Ensure users cannot publish files to the web or make visible to the world as public or unlisted"
  description   = "You should control the publishing of documents to the web or making them visable to the world as public or unlisted."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_2.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_3" {
  title         = "3.1.2.1.1.3 (L2) Ensure document sharing is being controlled by domain with allowlists"
  description   = "You should control sharing of documents to external domains by either blocking domains or only allowing sharing with specific named domains."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_3.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_4" {
  title         = "3.1.2.1.1.4 (L2) Ensure users are warned when they share a file with users in an allowlisted domain"
  description   = "Warn the user when they try and share a file and/or shared drive with users in an allowlisted domain."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_4.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_5" {
  title         = "3.1.2.1.1.5 (L1) Ensure Access Checker is configured to limit file access"
  description   = "When a user shares a file via a Google product other than Docs or Drive (e."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_5.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_1_6" {
  title         = "3.1.2.1.1.6 (L1) Ensure only users inside your organization can distribute content externally"
  description   = "You should control who is allowed to distribute organizational content to shared drives owned by another organization."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_1_6.md")

  tags = merge(local.cis_v120_3_1_2_1_1_common_tags, {
    cis_item_id = "3.1.2.1.1.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_2_1_2" {
  title         = "3.1.2.1.2 Shared Drive Creation"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2.md")
  children = [
    control.cis_v120_3_1_2_1_2_1,
    control.cis_v120_3_1_2_1_2_2,
    control.cis_v120_3_1_2_1_2_3,
    control.cis_v120_3_1_2_1_2_4
  ]

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_2_1" {
  title         = "3.1.2.1.2.1 (L1) Ensure users can create new shared drives"
  description   = "All users should have the ability to create new shared drives."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2_1.md")

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    cis_item_id = "3.1.2.1.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_2_2" {
  title         = "3.1.2.1.2.2 (L1) Ensure manager access members cannot modify shared drive settings"
  description   = "Only administrators should be able to modify shared drive settings."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2_2.md")

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    cis_item_id = "3.1.2.1.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_2_3" {
  title         = "3.1.2.1.2.3 (L1) Ensure shared drive file access is restricted to members only"
  description   = "Shared drive file access should be restricted to that shared drive's members."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2_3.md")

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    cis_item_id = "3.1.2.1.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_1_2_4" {
  title         = "3.1.2.1.2.4 (L2) Ensure viewers and commenters ability to download, print, and copy files is disabled"
  description   = "limit what viewers/commenters on a shared document can do with it."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_1_2_4.md")

  tags = merge(local.cis_v120_3_1_2_1_2_common_tags, {
    cis_item_id = "3.1.2.1.2.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}


benchmark "cis_v120_3_1_2_2" {
  title         = "3.1.2.2 Features and Applications"
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_2.md")
  children = [
    control.cis_v120_3_1_2_2_1,
    control.cis_v120_3_1_2_2_2,
    control.cis_v120_3_1_2_2_3
  ]

  tags = merge(local.cis_v120_3_1_2_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_2_1" {
  title         = "3.1.2.2.1 (L1) Ensure offline access to documents is disabled"
  description   = "Prevent documents from being locally accessible on an unconnected device."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_2_1.md")

  tags = merge(local.cis_v120_3_1_2_2_common_tags, {
    cis_item_id = "3.1.2.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_2_2" {
  title         = "3.1.2.2.2 (L1) Ensure desktop access to Drive is disabled"
  description   = "Prevent documents from being locally accessible on an unconnected device."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_2_2.md")

  tags = merge(local.cis_v120_3_1_2_2_common_tags, {
    cis_item_id = "3.1.2.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_2_2_3" {
  title         = "3.1.2.2.3 (L1) Ensure Add-Ons is disabled"
  description   = "Prevent users to install Google Docs add-ons from add-ons store."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_2_2_3.md")

  tags = merge(local.cis_v120_3_1_2_2_common_tags, {
    cis_item_id = "3.1.2.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}


benchmark "cis_v120_3_1_3" {
  title         = "3.1.3 Gmail"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3.md")
  children = [
    benchmark.cis_v120_3_1_3_1,
    benchmark.cis_v120_3_1_3_2,
    benchmark.cis_v120_3_1_3_3,
    benchmark.cis_v120_3_1_3_4,
    benchmark.cis_v120_3_1_3_5,
    benchmark.cis_v120_3_1_3_6,
    benchmark.cis_v120_3_1_3_7
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
    control.cis_v120_3_1_3_1_1,
    control.cis_v120_3_1_3_1_2
  ]

  tags = merge(local.cis_v120_3_1_3_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_1_1" {
  title         = "3.1.3.1.1 (L1) Ensure users cannot delegate access to their mailbox"
  description   = "Mail delegation allows the delegate to read, send, and delete messages on their behalf."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_1_1.md")

  tags = merge(local.cis_v120_3_1_3_1_common_tags, {
    cis_item_id = "3.1.3.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_1_2" {
  title         = "3.1.3.1.2 (L1) Ensure offline access to Gmail is disabled"
  description   = "Disables the user's ability to utilize various Gmail functions (read, write, search, delete, and label email messages) while not connected to the internet."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_1_2.md")

  tags = merge(local.cis_v120_3_1_3_1_common_tags, {
    cis_item_id = "3.1.3.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_2" {
  title         = "3.1.3.2 Authenticate email"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_2.md")
  children = [
    control.cis_v120_3_1_3_2_1,
    control.cis_v120_3_1_3_2_2,
    control.cis_v120_3_1_3_2_3
  ]

  tags = merge(local.cis_v120_3_1_3_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_2_1" {
  title         = "3.1.3.2.1 (L1) Ensure that DKIM is enabled for all mail enabled domains"
  description   = "DKIM adds an encrypted signature to the header of all outgoing messages."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_2_1.md")

  tags = merge(local.cis_v120_3_1_3_2_common_tags, {
    cis_item_id = "3.1.3.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_2_2" {
  title         = "3.1.3.2.2 (L1) Ensure the SPF record is configured for all mail enabled domains"
  description   = "For all the email domains configured in Google Workspace, a corresponding Sender Policy Framework (SPF) record should be created."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_2_2.md")

  tags = merge(local.cis_v120_3_1_3_2_common_tags, {
    cis_item_id = "3.1.3.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_2_3" {
  title         = "3.1.3.2.3 (L1) Ensure the DMARC record is configured for all mail enabled domains"
  description   = "For all email domains configured in Google Workspace, a corresponding Domain-Based Message Authentication, Reporting and Conformance (DMARC) record should be created."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_2_3.md")

  tags = merge(local.cis_v120_3_1_3_2_common_tags, {
    cis_item_id = "3.1.3.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_3" {
  title         = "3.1.3.3 Manage Quarantines"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_3.md")
  children = [
    control.cis_v120_3_1_3_3_1
  ]

  tags = merge(local.cis_v120_3_1_3_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_3_1" {
  title         = "3.1.3.3.1 (L1) Enable quarantine admin notifications for Gmail"
  description   = "Quarantines can help prevent spam, minimize data loss, and protect confidential information."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_3_1.md")

  tags = merge(local.cis_v120_3_1_3_3_common_tags, {
    cis_item_id = "3.1.3.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_4" {
  title         = "3.1.3.4 Safety"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4.md")
  children = [
    benchmark.cis_v120_3_1_3_4_1,
    benchmark.cis_v120_3_1_3_4_2,
    benchmark.cis_v120_3_1_3_4_3
  ]

  tags = merge(local.cis_v120_3_1_3_4_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_4_1" {
  title         = "3.1.3.4.1 Attachments"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_1.md")
  children = [
    control.cis_v120_3_1_3_4_1_1,
    control.cis_v120_3_1_3_4_1_2,
    control.cis_v120_3_1_3_4_1_3
  ]

  tags = merge(local.cis_v120_3_1_3_4_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_1_1" {
  title         = "3.1.3.4.1.1 (L1) Ensure protection against encrypted attachments from untrusted senders is enabled"
  description   = "As a Google Workspace administrator, you can protect incoming mail against phishing and harmful software (malware)."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_1_1.md")

  tags = merge(local.cis_v120_3_1_3_4_1_common_tags, {
    cis_item_id = "3.1.3.4.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_1_2" {
  title         = "3.1.3.4.1.2 (L1) Ensure protection against attachments with scripts from untrusted senders is enabled"
  description   = "As a Google Workspace administrator, you can protect incoming mail against phishing and harmful software (malware)."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_1_2.md")

  tags = merge(local.cis_v120_3_1_3_4_1_common_tags, {
    cis_item_id = "3.1.3.4.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_1_3" {
  title         = "3.1.3.4.1.3 (L1) Ensure protection against anomalous attachment types in emails is enabled"
  description   = "As a Google Workspace administrator, you can protect incoming mail against phishing and harmful software (malware)."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_1_3.md")

  tags = merge(local.cis_v120_3_1_3_4_1_common_tags, {
    cis_item_id = "3.1.3.4.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_4_2" {
  title         = "3.1.3.4.2 Links and external images"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_2.md")
  children = [
    control.cis_v120_3_1_3_4_2_1,
    control.cis_v120_3_1_3_4_2_2,
    control.cis_v120_3_1_3_4_2_3
  ]

  tags = merge(local.cis_v120_3_1_3_4_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_2_1" {
  title         = "3.1.3.4.2.1 (L1) Ensure link identification behind shortened URLs is enabled"
  description   = "Identify links behind short URLs, and display a warning when you click links to untrusted domains."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_2_1.md")

  tags = merge(local.cis_v120_3_1_3_4_2_common_tags, {
    cis_item_id = "3.1.3.4.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_2_2" {
  title         = "3.1.3.4.2.2 (L1) Ensure scan linked images for malicious content is enabled"
  description   = "Scan linked images for malicious content, and display a warning when you click links to untrusted domains."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_2_2.md")

  tags = merge(local.cis_v120_3_1_3_4_2_common_tags, {
    cis_item_id = "3.1.3.4.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_2_3" {
  title         = "3.1.3.4.2.3 (L1) Ensure warning prompt is shown for any click on links to untrusted domains"
  description   = "Display a warning when you click links to untrusted domains."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_2_3.md")

  tags = merge(local.cis_v120_3_1_3_4_2_common_tags, {
    cis_item_id = "3.1.3.4.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_4_3" {
  title         = "3.1.3.4.3 Spoofing and authentication"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_3.md")
  children = [
    control.cis_v120_3_1_3_4_3_1,
    control.cis_v120_3_1_3_4_3_2,
    control.cis_v120_3_1_3_4_3_3,
    control.cis_v120_3_1_3_4_3_4,
    control.cis_v120_3_1_3_4_3_5
  ]

  tags = merge(local.cis_v120_3_1_3_4_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_3_1" {
  title         = "3.1.3.4.3.1 (L1) Ensure protection against domain spoofing based on similar domain names is enabled"
  description   = "Moves domain spoofing emails to spam folder."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_3_1.md")

  tags = merge(local.cis_v120_3_1_3_4_3_common_tags, {
    cis_item_id = "3.1.3.4.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_3_2" {
  title         = "3.1.3.4.3.2 (L1) Ensure protection against spoofing of employee names is enabled"
  description   = "Moves employee spoofing emails to spam folder."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_3_2.md")

  tags = merge(local.cis_v120_3_1_3_4_3_common_tags, {
    cis_item_id = "3.1.3.4.3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_3_3" {
  title         = "3.1.3.4.3.3 (L1) Ensure protection against inbound emails spoofing your domain is enabled"
  description   = "Moves inbound emails spoofing your domain to spam folder."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_3_3.md")

  tags = merge(local.cis_v120_3_1_3_4_3_common_tags, {
    cis_item_id = "3.1.3.4.3.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_3_4" {
  title         = "3.1.3.4.3.4 (L1) Ensure protection against any unauthenticated emails is enabled"
  description   = "Displays a warning when any message is not authenticated (SPF or DKIM)."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_3_4.md")

  tags = merge(local.cis_v120_3_1_3_4_3_common_tags, {
    cis_item_id = "3.1.3.4.3.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_4_3_5" {
  title         = "3.1.3.4.3.5 (L1) Ensure groups are protected from inbound emails spoofing your domain"
  description   = "If a group receives an email that is spoofing your domain it is sent to the spam folder."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_4_3_5.md")

  tags = merge(local.cis_v120_3_1_3_4_3_common_tags, {
    cis_item_id = "3.1.3.4.3.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}


benchmark "cis_v120_3_1_3_5" {
  title         = "3.1.3.5 End User Access"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5.md")
  children = [
    control.cis_v120_3_1_3_5_1,
    control.cis_v120_3_1_3_5_2,
    control.cis_v120_3_1_3_5_3,
    control.cis_v120_3_1_3_5_4
  ]

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_5_1" {
  title         = "3.1.3.5.1 (L2) Ensure POP and IMAP access is disabled for all users"
  description   = "POP and IMAP may allow users to access Gmail using legacy or unapproved email clients that do not support modern authentication mechanisms, such as multifactor authentication."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5_1.md")

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    cis_item_id = "3.1.3.5.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_5_2" {
  title         = "3.1.3.5.2 (L1) Ensure automatic forwarding options are disabled"
  description   = "You should disable automatic forwarding to prevent users from auto-forwarding mail."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5_2.md")

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    cis_item_id = "3.1.3.5.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_5_3" {
  title         = "3.1.3.5.3 (L1) Ensure per-user outbound gateways is disabled"
  description   = "A per-user outbound gateway is a mail server, other than the Google Workspace mail servers, that delivers outgoing mail for a user in your domain."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5_3.md")

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    cis_item_id = "3.1.3.5.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_5_4" {
  title         = "3.1.3.5.4 (L1) Ensure external recipient warnings are enabled"
  description   = "Gmail adds an image or colored border to external addresses."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_5_4.md")

  tags = merge(local.cis_v120_3_1_3_5_common_tags, {
    cis_item_id = "3.1.3.5.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_6" {
  title         = "3.1.3.6 Spam, Phishing and Malware"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_6.md")
  children = [
    control.cis_v120_3_1_3_6_1,
    control.cis_v120_3_1_3_6_2
  ]

  tags = merge(local.cis_v120_3_1_3_6_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_6_1" {
  title         = "3.1.3.6.1 (L1) Ensure enhanced pre-delivery message scanning is enabled"
  description   = "Enables improved detection of suspicious content prior to delivery."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_6_1.md")

  tags = merge(local.cis_v120_3_1_3_6_common_tags, {
    cis_item_id = "3.1.3.6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_6_2" {
  title         = "3.1.3.6.2 (L1) Ensure spam filters are not bypased for internal senders"
  description   = "You can configure your advanced Gmail settings to bypass, or not bypass, spam filters for messages received from internal senders."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_6_2.md")

  tags = merge(local.cis_v120_3_1_3_6_common_tags, {
    cis_item_id = "3.1.3.6.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_3_7" {
  title         = "3.1.3.7 Compliance"
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_7.md")
  children = [
    control.cis_v120_3_1_3_7_1,
    control.cis_v120_3_1_3_7_2
  ]

  tags = merge(local.cis_v120_3_1_3_7_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_7_1" {
  title         = "3.1.3.7.1 (L1) Ensure comprehensive mail storage is enabled"
  description   = "Comprehensive mail storage ensures messages sent by other core services appear in users' sent folders and are therefore accessible to Vault."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_7_1.md")

  tags = merge(local.cis_v120_3_1_3_7_common_tags, {
    cis_item_id = "3.1.3.7.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_3_7_2" {
  title         = "3.1.3.7.2 (L1) Ensure 'Send email over a secure TLS connection' Is Enabled"
  description   = "The default is that Gmail always tries to send messages over a secure TLS connection."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_3_7_2.md")

  tags = merge(local.cis_v120_3_1_3_7_common_tags, {
    cis_item_id = "3.1.3.7.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_4" {
  title         = "3.1.4 Google Chat"
  documentation = file("./cis_v120/docs/cis_v120_3_1_4.md")
  children = [
    benchmark.cis_v120_3_1_4_1,
    benchmark.cis_v120_3_1_4_2,
    benchmark.cis_v120_3_1_4_3,
    benchmark.cis_v120_3_1_4_4
  ]

  tags = merge(local.cis_v120_3_1_4_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_4_1" {
  title         = "3.1.4.1 Chat File Sharing"
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_1.md")
  children = [
    control.cis_v120_3_1_4_1_1,
    control.cis_v120_3_1_4_1_2
  ]

  tags = merge(local.cis_v120_3_1_4_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_4_1_1" {
  title         = "3.1.4.1.1 (L1) Ensure external filesharing in Google Chat and Hangouts is disabled"
  description   = "Control how files are shared externally in Google Chat and Hangouts."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_1_1.md")

  tags = merge(local.cis_v120_3_1_4_1_common_tags, {
    cis_item_id = "3.1.4.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_4_1_2" {
  title         = "3.1.4.1.2 (L2) Ensure internal filesharing in Google Chat and Hangouts is disabled"
  description   = "Control how files are shared internally in Google Chat and Hangouts."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_1_2.md")

  tags = merge(local.cis_v120_3_1_4_1_common_tags, {
    cis_item_id = "3.1.4.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_4_2" {
  title         = "3.1.4.2 External Chat Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_2.md")
  children = [
    control.cis_v120_3_1_4_2_1
  ]

  tags = merge(local.cis_v120_3_1_4_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_4_2_1" {
  title         = "3.1.4.2.1 (L1) Ensure Google Chat externally is restricted to allowed domains"
  description   = "Control how users chat with people outside of your organization."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_2_1.md")

  tags = merge(local.cis_v120_3_1_4_2_common_tags, {
    cis_item_id = "3.1.4.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_4_3" {
  title         = "3.1.4.3 External Spaces"
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_3.md")
  children = [
    control.cis_v120_3_1_4_3_1
  ]

  tags = merge(local.cis_v120_3_1_4_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_4_3_1" {
  title         = "3.1.4.3.1 (L1) Ensure external spaces in Google Chat and Hangouts are restricted"
  description   = "Control whether users can create or join spaces within your organization that include external people outside of your organization."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_3_1.md")

  tags = merge(local.cis_v120_3_1_4_3_common_tags, {
    cis_item_id = "3.1.4.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_4_4" {
  title         = "3.1.4.4 Chat Apps"
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_4.md")
  children = [
    control.cis_v120_3_1_4_4_1,
    control.cis_v120_3_1_4_4_2
  ]

  tags = merge(local.cis_v120_3_1_4_4_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_4_4_1" {
  title         = "3.1.4.4.1 (L1) Ensure allow users to install Chat apps is disabled"
  description   = "Control the use of Chat apps in spaces or direct messages to connect to services in Google Chat and look up information, schedule meetings, or complete tasks."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_4_1.md")

  tags = merge(local.cis_v120_3_1_4_4_common_tags, {
    cis_item_id = "3.1.4.4.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_4_4_2" {
  title         = "3.1.4.4.2 (L1) Ensure allow users to add and use incoming webhooks is disabled"
  description   = "Allow users to configure incoming webhooks and developers to call incoming webhooks to post content."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_4_4_2.md")

  tags = merge(local.cis_v120_3_1_4_4_common_tags, {
    cis_item_id = "3.1.4.4.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_6" {
  title         = "3.1.6 Groups for Business"
  documentation = file("./cis_v120/docs/cis_v120_3_1_6.md")
  children = [
    control.cis_v120_3_1_6_1,
    control.cis_v120_3_1_6_2,
    control.cis_v120_3_1_6_3
  ]

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_6_1" {
  title         = "3.1.6.1 (L1) Ensure accessing groups from outside this organization is set to private"
  description   = "Choose whether people outside your organization can access your groups."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_6_1.md")

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    cis_item_id = "3.1.6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_6_2" {
  title         = "3.1.6.2 (L1) Ensure creating groups is restricted"
  description   = "Control who is allowed to create Groups in your organization and if they can have external members."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_6_2.md")

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    cis_item_id = "3.1.6.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_6_3" {
  title         = "3.1.6.3 (L1) Ensure default for permission to view conversations is restricted"
  description   = "By default, only allow group members to view group conversations."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_6_3.md")

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    cis_item_id = "3.1.6.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_7" {
  title         = "3.1.7 Sites"
  documentation = file("./cis_v120/docs/cis_v120_3_1_7.md")
  children = [
    control.cis_v120_3_1_7_1
  ]

  tags = merge(local.cis_v120_3_1_7_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_7_1" {
  title         = "3.1.7.1 (L1) Ensure service status for Google Sites is set to off"
  description   = "By default turn off Google Sites for all users."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_7_1.md")

  tags = merge(local.cis_v120_3_1_7_common_tags, {
    cis_item_id = "3.1.7.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_8" {
  title         = "3.1.8 Additional Google services"
  documentation = file("./cis_v120/docs/cis_v120_3_1_8.md")
  children = [
    control.cis_v120_3_1_8_1
  ]

  tags = merge(local.cis_v120_3_1_8_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_8_1" {
  title         = "3.1.8.1 (L1) Ensure access to external Google Groups is OFF for Everyone"
  description   = "Control whether users in your organization can access external groups from their Google Workspace account."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_8_1.md")

  tags = merge(local.cis_v120_3_1_8_common_tags, {
    cis_item_id = "3.1.8.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_9" {
  title         = "3.1.9 Google Workspace Marketplace"
  documentation = file("./cis_v120/docs/cis_v120_3_1_9.md")
  children = [
    benchmark.cis_v120_3_1_9_1
  ]

  tags = merge(local.cis_v120_3_1_9_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_3_1_9_1" {
  title         = "3.1.9.1 Settings"
  documentation = file("./cis_v120/docs/cis_v120_3_1_9_1.md")
  children = [
    control.cis_v120_3_1_9_1_1
  ]

  tags = merge(local.cis_v120_3_1_9_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_9_1_1" {
  title         = "3.1.9.1.1 (L1) Ensure users access to Google Workspace Marketplace apps is restricted"
  description   = "Restrict what Google Marketplace apps a user can install."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_3_1_9_1_1.md")

  tags = merge(local.cis_v120_3_1_9_1_common_tags, {
    cis_item_id = "3.1.9.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}
