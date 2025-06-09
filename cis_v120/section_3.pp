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
  sql           = query.drive_domain_restriction.sql
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
  sql           = query.drive_members_only_access.sql
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
  sql           = query.drive_viewer_restrictions.sql
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
  sql           = query.gmail_delegation_disabled.sql
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
  sql           = query.gmail_pop_imap_disabled.sql
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
  sql           = query.gmail_auto_forwarding_disabled.sql
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
    control.cis_v120_3_1_6_1,
    control.cis_v120_3_1_6_2
  ]

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_3_1_6_1" {
  title         = "3.1.6.1 (L1) Ensure accessing groups from outside this organization is set to private"
  description   = "Choose whether people outside your organization can access your groups."
  sql           = query.groups_external_access_restricted.sql
  documentation = file("./cis_v120/docs/cis_v120_3_1_6_1.md")

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    cis_item_id = "3.1.6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Groups"
  })
}

control "cis_v120_3_1_6_2" {
  title         = "3.1.6.2 (L1) Ensure creating groups is restricted"
  description   = "Control who is allowed to create Groups in your organization and if they can have external members."
  sql           = query.groups_admin_created_only.sql
  documentation = file("./cis_v120/docs/cis_v120_3_1_6_2.md")

  tags = merge(local.cis_v120_3_1_6_common_tags, {
    cis_item_id = "3.1.6.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Groups"
  })
}

query "gmail_delegation_disabled" {
  sql = <<-EOQ
    with all_users as (
      select primary_email as user_email from googledirectory_user
    ),
    gmail_settings as (
      select 
        u.user_email,
        gs.delegates
      from all_users u
      left join googleworkspace_gmail_settings gs on gs.user_email = u.user_email
    )
    select
      user_email as resource,
      case
        when delegates is null or jsonb_array_length(delegates) = 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when delegates is null or jsonb_array_length(delegates) = 0 then 'No mailbox delegation configured for user: ' || user_email
        else 'Mailbox delegation is enabled for user: ' || user_email || ' with ' || jsonb_array_length(delegates) || ' delegate(s)'
      end as reason
    from
      gmail_settings;
  EOQ
}

query "gmail_pop_imap_disabled" {
  sql = <<-EOQ
    with all_users as (
      select primary_email as user_email from googledirectory_user
    ),
    gmail_settings as (
      select 
        u.user_email,
        gs.pop,
        gs.imap
      from all_users u
      left join googleworkspace_gmail_settings gs on gs.user_email = u.user_email
    )
    select
      user_email as resource,
      case
        when (pop ->> 'accessWindow' = 'disabled' or pop ->> 'accessWindow' is null)
        and (imap ->> 'enabled' = 'false' or imap ->> 'enabled' is null) then 'ok'
        else 'alarm'
      end as status,
      case
        when (pop ->> 'accessWindow' = 'disabled' or pop ->> 'accessWindow' is null)
        and (imap ->> 'enabled' = 'false' or imap ->> 'enabled' is null) then 'POP and IMAP access disabled for user: ' || user_email
        when pop ->> 'accessWindow' != 'disabled' and pop ->> 'accessWindow' is not null then 'POP access enabled for user: ' || user_email || ' (access window: ' || (pop ->> 'accessWindow') || ')'
        when imap ->> 'enabled' = 'true' then 'IMAP access enabled for user: ' || user_email
        else 'POP or IMAP access may be enabled for user: ' || user_email
      end as reason
    from
      gmail_settings;
  EOQ
}

query "gmail_auto_forwarding_disabled" {
  sql = <<-EOQ
    with all_users as (
      select primary_email as user_email from googledirectory_user
    ),
    gmail_settings as (
      select 
        u.user_email,
        gs.auto_forwarding
      from all_users u
      left join googleworkspace_gmail_settings gs on gs.user_email = u.user_email
    )
    select
      user_email as resource,
      case
        when auto_forwarding ->> 'enabled' = 'false' or auto_forwarding ->> 'enabled' is null then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_forwarding ->> 'enabled' = 'false' or auto_forwarding ->> 'enabled' is null then 'Auto-forwarding disabled for user: ' || user_email
        else 'Auto-forwarding enabled for user: ' || user_email || ' to: ' || coalesce(auto_forwarding ->> 'emailAddress', 'unknown address')
      end as reason
    from
      gmail_settings;
  EOQ
}

query "groups_admin_created_only" {
  sql = <<-EOQ
    with group_creation_stats as (
      select
        count(*) as total_groups,
        count(*) filter (where admin_created = true) as admin_created_groups,
        count(*) filter (where admin_created = false) as user_created_groups
      from
        googledirectory_group
    )
    select
      'organization' as resource,
      case
        when user_created_groups = 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when user_created_groups = 0 then 'All ' || total_groups || ' groups were created by administrators'
        else 'Found ' || user_created_groups || ' groups created by users out of ' || total_groups || ' total groups'
      end as reason
    from
      group_creation_stats;
  EOQ
}

query "drive_members_only_access" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when drive_members_only = true then 'ok'
        else 'alarm'
      end as status,
      case
        when drive_members_only = true then 'Shared drive "' || name || '" restricts access to members only'
        else 'Shared drive "' || name || '" allows non-member access'
      end as reason
    from
      googleworkspace_drive;
  EOQ
}

query "drive_viewer_restrictions" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when copy_requires_writer_permission = true then 'ok'
        else 'alarm'
      end as status,
      case
        when copy_requires_writer_permission = true then 'Shared drive "' || name || '" restricts viewer download/print/copy capabilities'
        else 'Shared drive "' || name || '" allows viewers to download/print/copy files'
      end as reason
    from
      googleworkspace_drive;
  EOQ
}

query "groups_external_access_restricted" {
  sql = <<-EOQ
    with groups_with_members as (
      select 
        g.name as group_name,
        g.email as group_email,
        g.id as group_id,
        g.direct_members_count
      from googledirectory_group g
    )
    select
      group_email as resource,
      'info' as status,
      'Group "' || group_name || '" has ' || direct_members_count || ' members - external member analysis requires individual group inspection' as reason
    from
      groups_with_members;
  EOQ
}

query "drive_domain_restriction" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when domain_users_only = true then 'ok'
        else 'alarm'
      end as status,
      case
        when domain_users_only = true then 'Shared drive "' || name || '" is restricted to domain users only'
        else 'Shared drive "' || name || '" allows external domain access'
      end as reason
    from
      googleworkspace_drive;
  EOQ
}
