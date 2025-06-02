locals {
  cis_v120_2_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "2"
    service        = "Google Workspace/Devices"
  })
}

benchmark "cis_v120_2" {
  title         = "2 Devices"
  # documentation = file("./cis_v120/docs/cis_v120_2.md")
  children = [
    control.cis_v120_2_1,
    control.cis_v120_2_2,
    control.cis_v120_2_3
  ]

  tags = merge(local.cis_v120_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_2_1" {
  title         = "2.1 Ensure mobile devices require a minimum password length"
  description   = "Mobile devices accessing Google Workspace should require a minimum password length to enhance security."
  sql           = query.device_password_length.sql
  # documentation = file("./cis_v120/docs/cis_v120_2_1.md")

  tags = merge(local.cis_v120_2_common_tags, {
    cis_item_id = "2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Devices"
  })
}

control "cis_v120_2_2" {
  title         = "2.2 Ensure mobile devices require screen lock"
  description   = "Mobile devices accessing Google Workspace should require screen lock to prevent unauthorized access."
  sql           = query.device_screen_lock.sql
  # documentation = file("./cis_v120/docs/cis_v120_2_2.md")

  tags = merge(local.cis_v120_2_common_tags, {
    cis_item_id = "2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Devices"
  })
}

control "cis_v120_2_3" {
  title         = "2.3 Ensure mobile devices are set to wipe after failed login attempts"
  description   = "Mobile devices should be configured to wipe after a specified number of failed login attempts."
  sql           = query.device_wipe_enabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_2_3.md")

  tags = merge(local.cis_v120_2_common_tags, {
    cis_item_id = "2.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Google Workspace/Devices"
  })
}

query "device_password_length" {
  sql = <<-EOQ
    select
      case
        when password_length >= 8 then 'ok'
        else 'alarm'
      end as status,
      'Minimum password length is set to ' || password_length || ' characters.' as reason
    from
      googleworkspace_mobile_setting
    where
      field_name = 'PasswordLength';
  EOQ
}

query "device_screen_lock" {
  sql = <<-EOQ
    select
      case
        when screen_lock_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when screen_lock_enabled then 'Screen lock is enabled.'
        else 'Screen lock is disabled.'
      end as reason
    from
      googleworkspace_mobile_setting
    where
      field_name = 'ScreenLock';
  EOQ
}

query "device_wipe_enabled" {
  sql = <<-EOQ
    select
      case
        when wipe_after_failed_attempts > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when wipe_after_failed_attempts > 0 then 'Device wipe is enabled after ' || wipe_after_failed_attempts || ' failed attempts.'
        else 'Device wipe after failed attempts is disabled.'
      end as reason
    from
      googleworkspace_mobile_setting
    where
      field_name = 'WipeAfterFailedAttempts';
  EOQ
} 