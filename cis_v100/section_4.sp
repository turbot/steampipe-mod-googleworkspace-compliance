locals {
  cis_v100_4_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v100_4" {
  title         = "4 Drive and Docs"
  documentation = file("./cis_v100/docs/cis_v100_4.md")
  tags          = local.cis_v100_4_common_tags
  children = [
    control.cis_v100_4_3
  ]
}

control "cis_v100_4_3" {
  title         = "4.3 Ensure only users inside your organization can distribute content externally "
  description   = "You should control who is allowed to distribute organizational content to shared drives owned by another organization."
  sql           = query.google_drive_shared_external_members.sql
  documentation = file("./cis_v100/docs/cis_v100_4_3.md")

  tags = merge(local.cis_v100_4_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "1"
    cis_type    = "manual"
  })
}
