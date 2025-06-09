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
  sql           = query.admin_2fa_enrolled.sql
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
  sql           = query.all_users_2fa_enrolled.sql
  documentation = file("./cis_v120/docs/cis_v120_4_1_1_3.md")

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    cis_item_id = "4.1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

// 2FA compliance queries - check if users have enrolled in 2FA as required by policy

query "admin_2fa_enrolled" {
  sql = <<-EOQ
    with admin_users as (
      select 
        u.primary_email,
        u.is_admin,
        u.is_delegated_admin,
        u.is_enrolled_in_2sv,
        u.is_enforced_in_2sv,
        r.role_name,
        r.is_super_admin_role
      from googledirectory_user u
      left join googledirectory_role_assignment ra on u.id = ra.assigned_to
      left join googledirectory_role r on ra.role_id = r.role_id
      where u.is_admin = true or u.is_delegated_admin = true
    )
    select
      primary_email as resource,
      case
        when is_enrolled_in_2sv = false then 'alarm'
        when is_enrolled_in_2sv = true and is_enforced_in_2sv = false then 'info'
        else 'ok'
      end as status,
      case
        when is_enrolled_in_2sv = false then 
          format('Admin user %s is not enrolled in 2-Step Verification (role: %s)', primary_email, coalesce(role_name, 'Admin'))
        when is_enrolled_in_2sv = true and is_enforced_in_2sv = false then
          format('Admin user %s has 2FA enrolled but not enforced (role: %s)', primary_email, coalesce(role_name, 'Admin'))
        else 
          format('Admin user %s has 2-Step Verification properly configured (role: %s)', primary_email, coalesce(role_name, 'Admin'))
      end as reason
    from
      admin_users
    order by
      is_super_admin_role desc,
      is_enrolled_in_2sv asc,
      primary_email;
  EOQ
}

query "all_users_2fa_enrolled" {
  sql = <<-EOQ
    select
      primary_email as resource,
      case
        when is_enrolled_in_2sv = false then 'alarm'
        when is_enrolled_in_2sv = true and is_enforced_in_2sv = false then 'info'
        else 'ok'
      end as status,
      case
        when is_enrolled_in_2sv = false then 
          format('User %s is not enrolled in 2-Step Verification%s', primary_email, 
      case
        when is_admin then ' (ADMIN)' else '' end)
        when is_enrolled_in_2sv = true and is_enforced_in_2sv = false then
          format('User %s has 2FA enrolled but not enforced%s', primary_email,
      case
        when is_admin then ' (ADMIN)' else '' end)
        else 
          format('User %s has 2-Step Verification properly configured%s', primary_email,
      case
        when is_admin then ' (ADMIN)' else '' end)
      end as reason
    from
      googledirectory_user
    order by
      is_admin desc,
      is_enrolled_in_2sv asc,
      primary_email;
  EOQ
} 