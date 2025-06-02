# CIS Google Workspace Foundations Benchmark v1.2.0

## Overview

The CIS Google Workspace Foundations Benchmark provides prescriptive guidance for establishing a secure baseline configuration for Google Workspace. This benchmark was tested against Google Workspace and is current as of CIS Google Workspace Foundations Benchmark v1.2.0.

## Levels

The CIS Google Workspace Foundations Benchmark provides two levels of security settings:

- Level 1 - Recommended minimum security settings that should be configured on any Google Workspace deployment and should cause little or no interruption of service or reduced functionality
- Level 2 - Security settings that may negatively affect functionality or performance but provide enhanced security

## Sections

The benchmark is divided into four main sections:

1. Directory
   - User management and directory settings
2. Devices
   - Mobile device management and security settings
3. Apps
   - Settings for Google Workspace applications (Gmail, Calendar, Drive, etc.)
4. Security
   - Security and authentication settings

## Implementation

Each control in the benchmark is implemented using SQL queries against the Steampipe Google Workspace plugin tables. The results of these queries are then mapped to a status:

- `ok` - The control check passed
- `alarm` - The control check failed
- `info` - The control check found something that should be reviewed
- `skip` - The control check was skipped

## Running Benchmarks

You can run the full benchmark using:

```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120
```

Or run a specific section:

```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120_1
```

Or run a specific control:

```bash
powerpipe control run googleworkspace_compliance.control.cis_v120_1_1_1
``` 