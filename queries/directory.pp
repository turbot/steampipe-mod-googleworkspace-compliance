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
        when dual_role_count = 0 then 'All super admin accounts are dedicated (no dual admin roles).'
        else 'Found ' || dual_role_count || ' super admin account(s) that also have delegated admin roles.'
      end as reason
    from
      summary;
  EOQ
}

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
          format('Admin user %s is not enrolled in 2-Step Verification (role: %s).', primary_email, coalesce(role_name, 'Admin'))
        when is_enrolled_in_2sv = true and is_enforced_in_2sv = false then
          format('Admin user %s has 2FA enrolled but not enforced (role: %s).', primary_email, coalesce(role_name, 'Admin'))
        else 
          format('Admin user %s has 2-Step Verification properly configured (role: %s).', primary_email, coalesce(role_name, 'Admin'))
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
          format('User %s is not enrolled in 2-Step Verification%s.', primary_email, 
      case
        when is_admin then ' (ADMIN)' else '' end)
        when is_enrolled_in_2sv = true and is_enforced_in_2sv = false then
          format('User %s has 2FA enrolled but not enforced%s.', primary_email,
      case
        when is_admin then ' (ADMIN)' else '' end)
        else 
          format('User %s has 2-Step Verification properly configured%s.', primary_email,
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