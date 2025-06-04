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
  cis_v120_4_1_2_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.1.2"
  })
  cis_v120_4_1_3_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.1.3"
  })
  cis_v120_4_1_4_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.1.4"
  })
  cis_v120_4_1_5_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.1.5"
  })
  cis_v120_4_2_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2"
  })
  cis_v120_4_2_1_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2.1"
  })
  cis_v120_4_2_2_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2.2"
  })
  cis_v120_4_2_3_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2.3"
  })
  cis_v120_4_2_4_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2.4"
  })
  cis_v120_4_2_5_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2.5"
  })
  cis_v120_4_2_6_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.2.6"
  })
  cis_v120_4_3_common_tags = merge(local.cis_v120_4_common_tags, {
    cis_section_id = "4.3"
  })
}

benchmark "cis_v120_4" {
  title         = "4 Security"
  documentation = file("./cis_v120/docs/cis_v120_4.md")
  children = [
    benchmark.cis_v120_4_1,
    benchmark.cis_v120_4_2,
    benchmark.cis_v120_4_3
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
    benchmark.cis_v120_4_1_1,
    benchmark.cis_v120_4_1_2,
    benchmark.cis_v120_4_1_3,
    benchmark.cis_v120_4_1_4,
    benchmark.cis_v120_4_1_5
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
    control.cis_v120_4_1_1_2,
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
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_1_1.md")

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    cis_item_id = "4.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_1_2" {
  title         = "4.1.1.2 (L2) Ensure hardware security keys are used for all users in administrative roles and other high-value accounts"
  description   = "A hardware security key connects to a user's device using USB (A & C), Lightning, NFC, or Bluetooth connection."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_1_2.md")

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    cis_item_id = "4.1.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_1_3" {
  title         = "4.1.1.3 (L1) Ensure 2-Step Verification (Multi-Factor Authentication) is enforced for all users"
  description   = "Enforce 2-Step Verification (Multi-Factor Authentication) for all users."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_1_3.md")

  tags = merge(local.cis_v120_4_1_1_common_tags, {
    cis_item_id = "4.1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_1_2" {
  title         = "4.1.2 Account Recovery"
  documentation = file("./cis_v120/docs/cis_v120_4_1_2.md")
  children = [
    control.cis_v120_4_1_2_1,
    control.cis_v120_4_1_2_2
  ]

  tags = merge(local.cis_v120_4_1_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_2_1" {
  title         = "4.1.2.1 (L1) Ensure Super Admin account recovery is enabled"
  description   = "This option allows Super Admin users to recover access to their accounts if their password has been forgotten."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_2_1.md")

  tags = merge(local.cis_v120_4_1_2_common_tags, {
    cis_item_id = "4.1.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_2_2" {
  title         = "4.1.2.2 (L1) Ensure User account recovery is enabled"
  description   = "This option allows non-Super Admin users to recover access to their accounts if their password has been forgotten."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_2_2.md")

  tags = merge(local.cis_v120_4_1_2_common_tags, {
    cis_item_id = "4.1.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_1_3" {
  title         = "4.1.3 Advanced Protection Program"
  documentation = file("./cis_v120/docs/cis_v120_4_1_3.md")
  children = [
    control.cis_v120_4_1_3_1
  ]

  tags = merge(local.cis_v120_4_1_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_3_1" {
  title         = "4.1.3.1 (L2) Ensure Advanced Protection Program is configured"
  description   = "Enable Google's Advanced Protection Platform for all users and prevent the use of security codes where applicable."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_3_1.md")

  tags = merge(local.cis_v120_4_1_3_common_tags, {
    cis_item_id = "4.1.3.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_1_4" {
  title         = "4.1.4 Login Challenges"
  documentation = file("./cis_v120/docs/cis_v120_4_1_4.md")
  children = [
    control.cis_v120_4_1_4_1
  ]

  tags = merge(local.cis_v120_4_1_4_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_4_1" {
  title         = "4.1.4.1 (L2) Ensure login challenges are enforced"
  description   = "Configure Google Workspace to verify a user's identity post-sso."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_4_1.md")

  tags = merge(local.cis_v120_4_1_4_common_tags, {
    cis_item_id = "4.1.4.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_1_5" {
  title         = "4.1.5 Password Management"
  documentation = file("./cis_v120/docs/cis_v120_4_1_5.md")
  children = [
    control.cis_v120_4_1_5_1
  ]

  tags = merge(local.cis_v120_4_1_5_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_1_5_1" {
  title         = "4.1.5.1 (L1) Ensure password policy is configured for enhanced security"
  description   = "Configure Google Workspace Password Policy with a more secure length and is enforced upon next sign-in to protect against the use of common password attacks."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_1_5_1.md")

  tags = merge(local.cis_v120_4_1_5_common_tags, {
    cis_item_id = "4.1.5.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2" {
  title         = "4.2 Access and Data Control"
  documentation = file("./cis_v120/docs/cis_v120_4_2.md")
  children = [
    benchmark.cis_v120_4_2_1,
    benchmark.cis_v120_4_2_2,
    benchmark.cis_v120_4_2_3,
    benchmark.cis_v120_4_2_4,
    benchmark.cis_v120_4_2_5,
    benchmark.cis_v120_4_2_6
  ]

  tags = merge(local.cis_v120_4_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2_1" {
  title         = "4.2.1 API Controls"
  documentation = file("./cis_v120/docs/cis_v120_4_2_1.md")
  children = [
    control.cis_v120_4_2_1_1,
    control.cis_v120_4_2_1_2,
    control.cis_v120_4_2_1_3,
    control.cis_v120_4_2_1_4
  ]

  tags = merge(local.cis_v120_4_2_1_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_1_1" {
  title         = "4.2.1.1 (L2) Ensure application access to Google services is restricted"
  description   = "Prevent unrestricted application access to Google services."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_1_1.md")

  tags = merge(local.cis_v120_4_2_1_common_tags, {
    cis_item_id = "4.2.1.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_1_2" {
  title         = "4.2.1.2 (L2) Review third-party applications periodically"
  description   = "Weekly review connected applications for potential malicious or unintended access or connections."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_1_2.md")

  tags = merge(local.cis_v120_4_2_1_common_tags, {
    cis_item_id = "4.2.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_1_3" {
  title         = "4.2.1.3 (L1) Ensure internal apps can access Google Workspace APIs"
  description   = "Enable access to Google Workspace APIs for customer-owned / developed applications."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_1_3.md")

  tags = merge(local.cis_v120_4_2_1_common_tags, {
    cis_item_id = "4.2.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_1_4" {
  title         = "4.2.1.4 (L2) Review domain-wide delegation for applications periodically"
  description   = "Weekly review domain-wide delegations for applications for potentially malicious or unintended access or connections."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_1_4.md")

  tags = merge(local.cis_v120_4_2_1_common_tags, {
    cis_item_id = "4.2.1.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2_2" {
  title         = "4.2.2 Context-Aware Access"
  documentation = file("./cis_v120/docs/cis_v120_4_2_2.md")
  children = [
    control.cis_v120_4_2_2_1
  ]

  tags = merge(local.cis_v120_4_2_2_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_2_1" {
  title         = "4.2.2.1 (L1) Ensure blocking access from unapproved geographic locations"
  description   = "Restrict access to selected Google applications by geographic location."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_2_1.md")

  tags = merge(local.cis_v120_4_2_2_common_tags, {
    cis_item_id = "4.2.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2_3" {
  title         = "4.2.3 Data Protection"
  documentation = file("./cis_v120/docs/cis_v120_4_2_3.md")
  children = [
    control.cis_v120_4_2_3_1
  ]

  tags = merge(local.cis_v120_4_2_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_3_1" {
  title         = "4.2.3.1 (L1) Ensure DLP policies for Google Drive are configured"
  description   = "Enabling Data Loss Prevention (DLP) policies for Google Drive allows organizations to control the content that users can share in Google Drive files outside the organization."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_3_1.md")

  tags = merge(local.cis_v120_4_2_3_common_tags, {
    cis_item_id = "4.2.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2_4" {
  title         = "4.2.4 Google Session Control"
  documentation = file("./cis_v120/docs/cis_v120_4_2_4.md")
  children = [
    control.cis_v120_4_2_4_1
  ]

  tags = merge(local.cis_v120_4_2_4_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_4_1" {
  title         = "4.2.4.1 (L1) Ensure Google session control is configured"
  description   = "Configure Google Workspace's session control to strengthen session expiration."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_4_1.md")

  tags = merge(local.cis_v120_4_2_4_common_tags, {
    cis_item_id = "4.2.4.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2_5" {
  title         = "4.2.5 Google Cloud Session Control"
  documentation = file("./cis_v120/docs/cis_v120_4_2_5.md")
  children = [
    control.cis_v120_4_2_5_1
  ]

  tags = merge(local.cis_v120_4_2_5_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_5_1" {
  title         = "4.2.5.1 (L2) Ensure Google Cloud session control is configured"
  description   = "Configure Google cloud session control to strengthen session expiration."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_5_1.md")

  tags = merge(local.cis_v120_4_2_5_common_tags, {
    cis_item_id = "4.2.5.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}

benchmark "cis_v120_4_2_6" {
  title         = "4.2.6 Less Secure Apps"
  documentation = file("./cis_v120/docs/cis_v120_4_2_6.md")
  children = [
    control.cis_v120_4_2_6_1
  ]

  tags = merge(local.cis_v120_4_2_6_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/General"
  })
}

control "cis_v120_4_2_6_1" {
  title         = "4.2.6.1 (L1) Ensure less secure app access is disabled"
  description   = "Configure Google Workspace security settings to prevent access to less secure apps."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_2_6_1.md")

  tags = merge(local.cis_v120_4_2_6_common_tags, {
    cis_item_id = "4.2.6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/General"
  })
}


benchmark "cis_v120_4_3" {
  title         = "4.3 Security Center"
  documentation = file("./cis_v120/docs/cis_v120_4_3.md")
  children = [
    control.cis_v120_4_3_1,
    control.cis_v120_4_3_2
  ]

  tags = merge(local.cis_v120_4_3_common_tags, {
    type    = "Benchmark"
    service = "GoogleWorkspace/SecurityCenter"
  })
}

control "cis_v120_4_3_1" {
  title         = "4.3.1 (L1) Ensure the Dashboard is reviewed regularly for anomalies"
  description   = "As an administrator, you can use the security dashboard to see an overview of different security reports."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_3_1.md")

  tags = merge(local.cis_v120_4_3_common_tags, {
    cis_item_id = "4.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/SecurityCenter"
  })
}

control "cis_v120_4_3_2" {
  title         = "4.3.2 (L1) Ensure the Security health is reviewed regularly for anomalies"
  description   = "As an administrator, the security health page enables you to monitor the configuration of your Admin console settings from one location."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_4_3_2.md")

  tags = merge(local.cis_v120_4_3_common_tags, {
    cis_item_id = "4.3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "GoogleWorkspace/SecurityCenter"
  })
}
