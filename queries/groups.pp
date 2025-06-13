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
        when user_created_groups = 0 then 'All ' || total_groups || ' groups were created by administrators.'
        else 'Found ' || user_created_groups || ' groups created by users out of ' || total_groups || ' total groups.'
      end as reason
    from
      group_creation_stats;
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
      'Group "' || group_name || '" has ' || direct_members_count || ' members - external member analysis requires individual group inspection.' as reason
    from
      groups_with_members;
  EOQ
} 