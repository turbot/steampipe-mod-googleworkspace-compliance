locals {
  cis_v100_1_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v100_1" {
  title         = "1 Account / Authentication"
  documentation = file("./cis_v100/docs/cis_v100_1.md")
  tags          = local.cis_v100_1_common_tags
  children = [
    control.cis_v100_1_1,
    control.cis_v100_1_2
  ]
}

control "cis_v100_1_1" {
  title         = "1.1 Ensure 2-Step Verification (Multi-Factor Authentication) is enforced for all users in administrative roles"
  description   = "Enforce 2-Step Verification (Multi-Factor Authentication) for all users assigned administrative roles. These include roles such as: 'Help Desk Admin', 'Groups Admin', 'Super Admin', 'Services Admin', 'User Management Admin', 'Mobile Admin', 'Android Admin', 'Custom Admin Roles'."
  sql           = query.manual_control.sql
  documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.1"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v100_1_2" {
  title         = "1.2 Ensure 2-Step Verification (Multi-Factor Authentication) is enforced for all users"
  description   = "Enforce 2-Step Verification (Multi-Factor Authentication) for all users."
  sql           = query.ad_directory_user_mfa_enforced.sql
  documentation = file("./cis_v100/docs/cis_v100_1_2.md")

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.2"
    cis_level   = "1"
    cis_type    = "manual"
  })
}