locals {
  cis_v120_1_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "1"
    service        = "Google Workspace/Directory"
  })
}

benchmark "cis_v120_1" {
  title         = "1 Directory"
  documentation = file("./cis_v120/docs/cis_v120_1.md")
  children = [
    control.cis_v120_1_1_1,
    control.cis_v120_1_1_2,
    control.cis_v120_1_1_3,
    control.cis_v120_1_2_1_1
  ]

  tags = merge(local.cis_v120_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_1_1_1" {
  title       = "1.1.1 Ensure more than one Super Admin account exists"
  description = "Multiple super admin accounts should exist to ensure administrative access in case of emergency."
  sql         = query.admin_super_admin_count.sql
  # documentation = file("./cis_v120/docs/cis_v120_1_1_1.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Directory"
  })
}

control "cis_v120_1_1_2" {
  title       = "1.1.2 Ensure no more than 4 Super Admin accounts exist"
  description = "The number of super admin accounts should be limited to reduce the attack surface."
  sql         = query.admin_super_admin_max_count.sql
  # documentation = file("./cis_v120/docs/cis_v120_1_1_2.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Directory"
  })
}

control "cis_v120_1_1_3" {
  title       = "1.1.3 Ensure super admin accounts are used only for super admin activities"
  description = "Super admin accounts should be dedicated to super admin activities only."
  sql         = query.admin_super_admin_usage.sql
  # documentation = file("./cis_v120/docs/cis_v120_1_1_3.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Directory"
  })
}

control "cis_v120_1_2_1_1" {
  title       = "1.2.1.1 Ensure directory data access is externally restricted"
  description = "Directory data should not be accessible to external users or domains."
  sql         = query.directory_external_sharing.sql
  # documentation = file("./cis_v120/docs/cis_v120_1_2_1_1.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.2.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Directory"
  })
}

query "admin_super_admin_count" {
  sql = <<-EOQ
    with super_admins as (
      select
        count(*) as count
      from
        googledirectory_user
      where
        is_admin = true
    )
    select
      case
        when count > 1 then 'ok'
        else 'alarm'
      end as status,
      'Found ' || count || ' super admin account(s).' as reason
    from
      super_admins;
  EOQ
}

query "admin_super_admin_max_count" {
  sql = <<-EOQ
    with super_admins as (
      select
        count(*) as count
      from
        googledirectory_user
      where
        is_admin = true
    )
    select
      case
        when count <= 4 then 'ok'
        else 'alarm'
      end as status,
      'Found ' || count || ' super admin account(s).' as reason
    from
      super_admins;
  EOQ
}

query "admin_super_admin_usage" {
  sql = <<-EOQ
    with super_admin_roles as (
      select
        u.primary_email,
        r.role_assignment_id,
        r.assigned_to
      from
        googledirectory_user u
        left join googledirectory_role_assignment r on u.primary_email = r.assigned_to
      where
        u.is_admin = true
        and r.role_assignment_id is not null
    )
    select
      case
        when count(*) = 0 then 'ok'
        else 'info'
      end as status,
      'Found ' || count(*) || ' super admin role assignment(s).' as reason
    from
      super_admin_roles;
  EOQ
}

query "directory_external_sharing" {
  sql = <<-EOQ
    select
      domain_name as resource,
      case
        when verified = false then 'ok'
        else 'alarm'
      end as status,
      case
        when verified = false then 'Directory sharing with external domains is disabled.'
        else 'Directory sharing with external domains is enabled.'
      end as reason
    from
      googledirectory_domain;
  EOQ
} 