locals {
  cis_v120_3_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "3"
    service        = "Google Workspace/Apps"
  })
}

benchmark "cis_v120_3" {
  title = "3 Apps"
  # documentation = file("./cis_v120/docs/cis_v120_3.md")
  children = [
    benchmark.cis_v120_3_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v120_3_1" {
  title = "3.1 Google Workspace"
  # documentation = file("./cis_v120/docs/cis_v120_3_1.md")
  children = [
    benchmark.cis_v120_3_1_1,
    benchmark.cis_v120_3_1_2,
    benchmark.cis_v120_3_1_3,
    benchmark.cis_v120_3_1_4,
    benchmark.cis_v120_3_1_5,
    benchmark.cis_v120_3_1_6,
    benchmark.cis_v120_3_1_7,
    benchmark.cis_v120_3_1_8,
    benchmark.cis_v120_3_1_9
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

# Calendar Controls
benchmark "cis_v120_3_1_1" {
  title = "3.1.1 Calendar"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_1.md")
  children = [
    control.cis_v120_3_1_1_1,
    control.cis_v120_3_1_1_2,
    control.cis_v120_3_1_1_3
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_1_1" {
  title       = "3.1.1.1 Ensure external sharing options for primary calendars are configured"
  description = "Primary calendar sharing settings should be restricted to prevent unauthorized external access."
  sql         = query.calendar_external_sharing.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_1_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Calendar"
  })
}

control "cis_v120_3_1_1_2" {
  title       = "3.1.1.2 Ensure internal sharing options for primary calendars are configured"
  description = "Primary calendar sharing settings should be restricted to appropriate internal users."
  sql         = query.calendar_internal_sharing.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_1_2.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Google Workspace/Calendar"
  })
}

control "cis_v120_3_1_1_3" {
  title       = "3.1.1.3 Ensure external invitation warnings for Google Calendar are configured"
  description = "Users should be warned when creating calendar events with external participants."
  sql         = query.calendar_external_invites.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_1_3.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Calendar"
  })
}

# Gmail Controls
benchmark "cis_v120_3_1_3" {
  title = "3.1.3 Gmail"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_3.md")
  children = [
    control.cis_v120_3_1_3_1,
    control.cis_v120_3_1_3_2,
    control.cis_v120_3_1_3_3
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_3_1" {
  title       = "3.1.3.1 Ensure DKIM is enabled for all mail enabled domains"
  description = "DKIM should be enabled to help prevent email spoofing."
  sql         = query.gmail_dkim_enabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_3_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Gmail"
  })
}

control "cis_v120_3_1_3_2" {
  title       = "3.1.3.2 Ensure SPF record is configured for all mail enabled domains"
  description = "SPF records should be configured to help prevent email spoofing."
  sql         = query.gmail_spf_enabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_3_2.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Gmail"
  })
}

control "cis_v120_3_1_3_3" {
  title       = "3.1.3.3 Ensure DMARC record is configured for all mail enabled domains"
  description = "DMARC should be configured to help prevent email spoofing and phishing."
  sql         = query.gmail_dmarc_enabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_3_3.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.3.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Gmail"
  })
}

# Queries for the controls
query "calendar_external_sharing" {
  sql = <<-EOQ
    -- Note: This query requires calendar.settings.readonly or calendar.settings scope
    -- and impersonated_user_email configuration
    select
      'primary' as resource,
      -- Note: access_role column doesn't exist, needs to be added to plugin
      'info' as status,
      'Calendar external sharing cannot be verified - access_role column not available in schema' as reason
    from
      googleworkspace_calendar
    where
      id = 'primary';
  EOQ
}

query "calendar_internal_sharing" {
  sql = <<-EOQ
    -- Note: This query requires calendar.settings.readonly or calendar.settings scope
    -- and impersonated_user_email configuration
    select
      'primary' as resource,
      -- Note: access_role column doesn't exist, needs to be added to plugin
      'info' as status,
      'Calendar internal sharing cannot be verified - access_role column not available in schema' as reason
    from
      googleworkspace_calendar
    where
      id = 'primary';
  EOQ
}

query "calendar_external_invites" {
  sql = <<-EOQ
    -- Note: This query requires calendar.settings.readonly or calendar.settings scope
    -- and impersonated_user_email configuration
    select
      'primary' as resource,
      case
        when conference_properties -> 'allowExternalPersons' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when conference_properties -> 'allowExternalPersons' = 'false'
        then 'External invitation warnings are enabled'
        else 'External invitation warnings are disabled'
      end as reason
    from
      googleworkspace_calendar
    where
      id = 'primary';
  EOQ
}

query "gmail_dkim_enabled" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: dkim_verification_state column doesn't exist, needs to be added to plugin
      'info' as status,
      'DKIM verification state cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

query "gmail_spf_enabled" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: spf_verification_state column doesn't exist, needs to be added to plugin
      'info' as status,
      'SPF verification state cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

query "gmail_dmarc_enabled" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: dmarc_verification_state column doesn't exist, needs to be added to plugin
      'info' as status,
      'DMARC verification state cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

benchmark "cis_v120_3_1_2" {
  title = "3.1.2 Drive and Docs"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_2.md")
  children = [
    control.cis_v120_3_1_2_1,
    control.cis_v120_3_1_2_2
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_2_1" {
  title       = "3.1.2.1 Ensure users cannot publish files to the web"
  description = "File publishing to the web should be restricted to prevent unauthorized data exposure."
  sql         = query.drive_publish_disabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_2_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Drive"
  })
}

control "cis_v120_3_1_2_2" {
  title       = "3.1.2.2 Ensure users cannot share files outside the organization"
  description = "External file sharing should be restricted to prevent unauthorized data exposure."
  sql         = query.drive_external_sharing_disabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_2_2.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.2.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Google Workspace/Drive"
  })
}

benchmark "cis_v120_3_1_4" {
  title = "3.1.4 Google Chat"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_4.md")
  children = [
    control.cis_v120_3_1_4_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_4_1" {
  title       = "3.1.4.1 Ensure chat external communication is restricted"
  description = "External chat communication should be restricted to prevent data leakage."
  sql         = query.chat_external_disabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_4_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.4.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Chat"
  })
}

benchmark "cis_v120_3_1_5" {
  title = "3.1.5 Google Meet"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_5.md")
  children = [
    control.cis_v120_3_1_5_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_5_1" {
  title       = "3.1.5.1 Ensure external participants cannot join meetings by default"
  description = "External meeting participants should be restricted by default."
  sql         = query.meet_external_disabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_5_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.5.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Meet"
  })
}

benchmark "cis_v120_3_1_6" {
  title = "3.1.6 Groups for Business"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_6.md")
  children = [
    control.cis_v120_3_1_6_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_6_1" {
  title       = "3.1.6.1 Ensure users cannot create groups"
  description = "Group creation should be restricted to administrators."
  sql         = query.groups_creation_restricted.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_6_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Groups"
  })
}

benchmark "cis_v120_3_1_7" {
  title = "3.1.7 Sites"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_7.md")
  children = [
    control.cis_v120_3_1_7_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_7_1" {
  title       = "3.1.7.1 Ensure users cannot publish sites"
  description = "Site publishing should be restricted to prevent unauthorized content publishing."
  sql         = query.sites_publishing_restricted.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_7_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.7.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Sites"
  })
}

benchmark "cis_v120_3_1_8" {
  title = "3.1.8 Additional Google Services"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_8.md")
  children = [
    control.cis_v120_3_1_8_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_8_1" {
  title       = "3.1.8.1 Ensure only approved Google services are enabled"
  description = "Only necessary Google services should be enabled for the organization."
  sql         = query.services_approved_only.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_8_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.8.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Services"
  })
}

benchmark "cis_v120_3_1_9" {
  title = "3.1.9 Google Workspace Marketplace"
  # documentation = file("./cis_v120/docs/cis_v120_3_1_9.md")
  children = [
    control.cis_v120_3_1_9_1
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_3_1_9_1" {
  title       = "3.1.9.1 Ensure only approved apps can be installed"
  description = "Installation of third-party apps should be restricted to approved apps only."
  sql         = query.marketplace_apps_restricted.sql
  # documentation = file("./cis_v120/docs/cis_v120_3_1_9_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1.9.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Marketplace"
  })
}

# Additional queries for new controls
query "drive_publish_disabled" {
  sql = <<-EOQ
    -- Note: This query requires drive.settings.readonly or drive.settings scope
    -- and impersonated_user_email configuration
    select
      id as resource,
      case
        when capabilities -> 'canPublish' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when capabilities -> 'canPublish' = 'false' then 'File publishing to web is disabled'
        else 'File publishing to web is enabled'
      end as reason
    from
      googleworkspace_drive
    where
      id = 'root';
  EOQ
}

query "drive_external_sharing_disabled" {
  sql = <<-EOQ
    -- Note: This query requires drive.settings.readonly or drive.settings scope
    -- and impersonated_user_email configuration
    select
      id as resource,
      case
        when capabilities -> 'canShare' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when capabilities -> 'canShare' = 'false' then 'External file sharing is disabled'
        else 'External file sharing is enabled'
      end as reason
    from
      googleworkspace_drive
    where
      id = 'root';
  EOQ
}

query "chat_external_disabled" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: allow_external_communications column doesn't exist, needs to be added to plugin
      'info' as status,
      'Chat external communication settings cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

query "meet_external_disabled" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: allow_external_participants column doesn't exist, needs to be added to plugin
      'info' as status,
      'Meet external participants settings cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

query "groups_creation_restricted" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.group scope
    -- and impersonated_user_email configuration
    select
      email as resource,
      -- Note: allow_external_members column doesn't exist, needs to be added to plugin
      'info' as status,
      'Group creation restrictions cannot be checked - column not available in schema' as reason
    from
      googledirectory_group;
  EOQ
}

query "sites_publishing_restricted" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: sites_publishing_enabled column doesn't exist, needs to be added to plugin
      'info' as status,
      'Sites publishing settings cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

query "services_approved_only" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: service_status and is_enforced columns don't exist, needs to be added to plugin
      'info' as status,
      'Service approval settings cannot be checked - columns not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
}

query "marketplace_apps_restricted" {
  sql = <<-EOQ
    -- Note: This query requires admin.directory.domain scope
    -- and impersonated_user_email configuration
    select
      domain_name as resource,
      -- Note: marketplace_apps_enabled column doesn't exist, needs to be added to plugin
      'info' as status,
      'Marketplace apps restrictions cannot be checked - column not available in schema' as reason
    from
      googledirectory_domain;
  EOQ
} 