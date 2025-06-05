query "manual_control" {
  sql = <<-EOQ
    select
      'arn:partition:service:region:account-id:resource-type/resource-id' as resource,
      'info' as status,
      'Manual verification required for this control.' as reason;
  EOQ
} 