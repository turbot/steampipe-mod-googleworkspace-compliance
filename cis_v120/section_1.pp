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
  sql           = query.admin_super_admin_count.sql
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
  sql           = query.admin_super_admin_max_count.sql
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
  sql           = query.admin_super_admin_dedicated.sql
  documentation = file("./cis_v120/docs/cis_v120_1_1_3.md")

  tags = merge(local.cis_v120_1_1_common_tags, {
    cis_item_id = "1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/Directory"
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
      'organization' as resource,
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
      'organization' as resource,
      case
        when count <= 4 then 'ok'
        else 'alarm'
      end as status,
      'Found ' || count || ' super admin account(s). Maximum recommended is 4.' as reason
    from
      super_admins;
  EOQ
}

query "admin_super_admin_dedicated" {
  sql = <<-EOQ
    with dual_role_admins as (
      select
        primary_email,
        full_name,
        id
      from
        googledirectory_user
      where
        is_admin = true
        and is_delegated_admin = true
    ),
    summary as (
      select
        count(*) as dual_role_count
      from
        dual_role_admins
    )
    select
      'organization' as resource,
      case
        when dual_role_count = 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when dual_role_count = 0 then 'All super admin accounts are dedicated (no dual admin roles)'
        else 'Found ' || dual_role_count || ' super admin account(s) that also have delegated admin roles'
      end as reason
    from
      summary;
  EOQ
}
