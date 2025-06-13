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