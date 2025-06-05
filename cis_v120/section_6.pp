locals {
  cis_v120_6_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "6"
  })
}

benchmark "cis_v120_6" {
  title         = "6 Rules"
  documentation = file("./cis_v120/docs/cis_v120_6.md")
  children = [
    control.cis_v120_6_1,
    control.cis_v120_6_2,
    control.cis_v120_6_3,
    control.cis_v120_6_4,
    control.cis_v120_6_5,
    control.cis_v120_6_6,
    control.cis_v120_6_7,
    control.cis_v120_6_8
  ]

  tags = merge(local.cis_v120_6_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_1" {
  title         = "6.1 (L1) Ensure User's password changed is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when a user's password has changed."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_1.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_2" {
  title         = "6.2 (L1) Ensure Government-backed attacks is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when Google believes your users are being targeted by a government-backed attack."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_2.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_3" {
  title         = "6.3 (L1) Ensure User suspended due to suspicious activity is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when Google suspended a user's account due to a potential compromise detected."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_3.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_4" {
  title         = "6.4 (L1) Ensure User granted Admin privilege is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when a user has been granted an admin privilege."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_4.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_5" {
  title         = "6.5 (L1) Ensure Suspicious programmatic login is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when Google detects suspicious login attempts from applications or computer programs."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_5.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_6" {
  title         = "6.6 (L1) Ensure Suspicious login is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when Google detects a sign-in attempt that doesn't match a user's normal behavior, such as a sign-in from an unusual location."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_6.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_7" {
  title         = "6.7 (L1) Ensure Leaked password is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when Google detects compromised credentials requiring a reset of a user's password."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_7.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_6_8" {
  title         = "6.8 (L1) Ensure Gmail potential employee spoofing is configured"
  description   = "Configuring and enabling the setting that an alert will be generated when Google detects incoming messages are received where a sender's name is in your Google Workspace directory, but the mail is not from your company's domains or domain aliases."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_6_8.md")

  tags = merge(local.cis_v120_6_common_tags, {
    cis_item_id = "6.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}
