locals {
  cis_v120_4_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "4"
    service        = "Google Workspace/Security"
  })
}

benchmark "cis_v120_4" {
  title = "4 Security"
  # documentation = file("./cis_v120/docs/cis_v120_4.md")
  children = [
    benchmark.cis_v120_4_1,
    benchmark.cis_v120_4_2
  ]

  tags = merge(local.cis_v120_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v120_4_1" {
  title = "4.1 Authentication"
  # documentation = file("./cis_v120/docs/cis_v120_4_1.md")
  children = [
    control.cis_v120_4_1_1,
    control.cis_v120_4_1_2,
    control.cis_v120_4_1_3,
    control.cis_v120_4_1_4,
    control.cis_v120_4_1_5
  ]

  tags = merge(local.cis_v120_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_4_1_1" {
  title       = "4.1.1 Ensure 2-Step Verification is enforced for all users in administrative roles"
  description = "Two-factor authentication should be enforced for all administrative users to enhance security."
  sql         = query.admin_2sv_enforced.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_1_1.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

control "cis_v120_4_1_2" {
  title       = "4.1.2 Ensure 2-Step Verification is enforced for all users"
  description = "Two-factor authentication should be enforced for all users to enhance security."
  sql         = query.user_2sv_enforced.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_1_2.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

control "cis_v120_4_1_3" {
  title       = "4.1.3 Ensure password policy is configured for enhanced security"
  description = "Password policy should be configured to enforce minimum security requirements."
  sql         = query.password_policy.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_1_3.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

control "cis_v120_4_1_4" {
  title       = "4.1.4 Ensure user account recovery options are disabled"
  description = "User account recovery options should be disabled to prevent unauthorized access."
  sql         = query.account_recovery_disabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_1_4.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.1.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

control "cis_v120_4_1_5" {
  title       = "4.1.5 Ensure login challenges are enforced"
  description = "Login challenges should be enforced to provide additional security verification."
  sql         = query.login_challenges.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_1_5.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.1.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

benchmark "cis_v120_4_2" {
  title = "4.2 Access and Data Control"
  # documentation = file("./cis_v120/docs/cis_v120_4_2.md")
  children = [
    control.cis_v120_4_2_1,
    control.cis_v120_4_2_2,
    control.cis_v120_4_2_3
  ]

  tags = merge(local.cis_v120_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_4_2_1" {
  title       = "4.2.1 Ensure DLP policies for Google Drive are configured"
  description = "Data Loss Prevention policies should be configured to protect sensitive data in Google Drive."
  sql         = query.drive_dlp_enabled.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_2_1.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

control "cis_v120_4_2_2" {
  title       = "4.2.2 Ensure Google session control is configured"
  description = "Session control settings should be configured to manage user sessions securely."
  sql         = query.session_control.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_2_2.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

control "cis_v120_4_2_3" {
  title       = "4.2.3 Ensure access from unapproved geographic locations is blocked"
  description = "Access should be blocked from geographic locations that are not approved for your organization."
  sql         = query.geo_location_blocking.sql
  # documentation = file("./cis_v120/docs/cis_v120_4_2_3.md")

  tags = merge(local.cis_v120_4_common_tags, {
    cis_item_id = "4.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Google Workspace/Security"
  })
}

# Queries
query "admin_2sv_enforced" {
  sql = <<-EOQ
    select
      case
        when enforce_2sv_admin then 'ok'
        else 'alarm'
      end as status,
      case
        when enforce_2sv_admin then '2-Step Verification is enforced for admin users.'
        else '2-Step Verification is not enforced for admin users.'
      end as reason
    from
      googleworkspace_security_settings;
  EOQ
}

query "user_2sv_enforced" {
  sql = <<-EOQ
    select
      case
        when enforce_2sv then 'ok'
        else 'alarm'
      end as status,
      case
        when enforce_2sv then '2-Step Verification is enforced for all users.'
        else '2-Step Verification is not enforced for all users.'
      end as reason
    from
      googleworkspace_security_settings;
  EOQ
}

query "password_policy" {
  sql = <<-EOQ
    select
      case
        when minimum_length >= 8
        and enforce_strong_password = true then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_length >= 8 and enforce_strong_password = true
        then 'Password policy meets minimum security requirements.'
        else 'Password policy does not meet minimum security requirements.'
      end as reason
    from
      googleworkspace_password_policy;
  EOQ
}

query "account_recovery_disabled" {
  sql = <<-EOQ
    select
      case
        when enable_account_recovery = false then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_account_recovery = false
        then 'Account recovery is disabled.'
        else 'Account recovery is enabled.'
      end as reason
    from
      googleworkspace_security_settings;
  EOQ
}

query "login_challenges" {
  sql = <<-EOQ
    select
      case
        when enforce_login_challenges then 'ok'
        else 'alarm'
      end as status,
      case
        when enforce_login_challenges
        then 'Login challenges are enforced.'
        else 'Login challenges are not enforced.'
      end as reason
    from
      googleworkspace_security_settings;
  EOQ
}

query "drive_dlp_enabled" {
  sql = <<-EOQ
    select
      case
        when dlp_rules is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when dlp_rules is not null
        then 'DLP rules are configured for Google Drive.'
        else 'No DLP rules configured for Google Drive.'
      end as reason
    from
      googleworkspace_drive_settings;
  EOQ
}

query "session_control" {
  sql = <<-EOQ
    select
      case
        when session_duration_in_hours <= 8 then 'ok'
        else 'alarm'
      end as status,
      'Session duration is set to ' || session_duration_in_hours || ' hours.' as reason
    from
      googleworkspace_security_settings;
  EOQ
}

query "geo_location_blocking" {
  sql = <<-EOQ
    select
      case
        when allowed_regions is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when allowed_regions is not null
        then 'Geographic location restrictions are configured.'
        else 'No geographic location restrictions configured.'
      end as reason
    from
      googleworkspace_security_settings;
  EOQ
} 