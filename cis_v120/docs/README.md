<!--
# CIS v1.2.0 Benchmark

## Overview
The CIS Google Workspace Benchmark provides prescriptive guidance for establishing a secure configuration posture for Google Workspace. This document outlines the controls and implementation guidance for version 1.2.0 of the benchmark.

## Sections

### 1. Directory
Controls in this section focus on Google Workspace Directory settings, including user management and directory data sharing. Key areas include:
- Super admin account management
- Directory sharing settings
- User access controls

### 2. Devices
Controls in this section focus on device management and security settings. Key areas include:
- Mobile device management
- Device security policies
- Screen lock and encryption requirements

### 3. Apps
Controls in this section focus on Google Workspace application security. Key areas include:
- Calendar sharing and access
- Drive and Docs security
- Gmail configuration (DKIM, SPF, DMARC)
- Google Chat and Meet security
- Groups for Business settings
- Sites security

### 4. Security
Controls in this section focus on overall security settings. Key areas include:
- Two-factor authentication
- Password policies
- Data Loss Prevention
- Access and session controls

## Implementation Notes

Each control in this benchmark is implemented using SQL queries against the Steampipe Google Workspace plugin tables. The queries check various aspects of configuration and return one of the following status values:

- `ok` - The control check passed
- `alarm` - The control check failed
- `info` - The control check found something that should be reviewed
- `skip` - The control check was skipped

## Running the Benchmark

To run the full CIS v1.2.0 benchmark:

```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120
```

To run a specific section of the benchmark:

```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120_1
```

## Variables

This benchmark refers to common variables for defining both the common and tag dimensions. Each can be passed as environment variables:

```bash
export PP_VAR_common_dimensions='["domain", "connection_name"]'
export PP_VAR_tag_dimensions='["Environment", "Owner"]'
```

Or in a `powerpipe.ppvars` file:

```hcl
common_dimensions = ["domain", "connection_name"]
tag_dimensions = ["Environment", "Owner"]
```
--> 