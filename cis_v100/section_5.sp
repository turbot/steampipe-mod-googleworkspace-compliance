locals {
  cis_v100_5_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v100_5" {
  title         = "5 Gmail"
  documentation = file("./cis_v100/docs/cis_v100_5.md")
  tags          = local.cis_v100_5_common_tags
  children = [
    control.cis_v100_5_1,
    control.cis_v100_5_16,
    control.cis_v100_5_17
  ]
}

control "cis_v100_5_1" {
  title         = "5.1 Ensure users cannot delegate access to their mailbox"
  description   = "Mail delegation allows the delegate to read, send, and delete messages on their behalf. For example, a manager can delegate Gmail access to another person in their organization, such as an administrative assistant."
  sql           = query.user_mailbox_delegation_restricted.sql
  documentation = file("./cis_v100/docs/cis_v100_5_1.md")

  tags = merge(local.cis_v100_5_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v100_5_16" {
  title         = "5.16 Ensure POP and IMAP access is disabled for all users"
  description   = "POP and IMAP may allow users to access Gmail using legacy or unapproved email clients that do not support modern authentication mechanisms, such as multifactor authentication."
  sql           = query.user_gmail_imap_pop_setting.sql
  documentation = file("./cis_v100/docs/cis_v100_5_16.md")

  tags = merge(local.cis_v100_5_common_tags, {
    cis_item_id = "5.16"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v100_5_17" {
  title         = "5.17 Ensure automatic forwarding options are disabled"
  description   = "You should disable automatic forwarding to prevent users from auto-forwarding mail."
  sql           = query.manual_control.sql
  documentation = file("./cis_v100/docs/cis_v100_5_17.md")

  tags = merge(local.cis_v100_5_common_tags, {
    cis_item_id = "5.17"
    cis_level   = "1"
    cis_type    = "manual"
  })
}