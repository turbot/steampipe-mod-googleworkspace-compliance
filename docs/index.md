# Table of Contents

## Google Workspace Compliance Mod for Powerpipe

* [CIS v1.2.0 Benchmark](../cis_v120/docs/cis_v120_1.md)
  * [Directory](../cis_v120/docs/cis_v120_1.md)
  * [Devices](../cis_v120/docs/cis_v120_2.md)
  * [Apps](../cis_v120/docs/cis_v120_3.md)
  * [Security](../cis_v120/docs/cis_v120_4.md)

## Mod Details

### Configuration

This mod uses a common set of [variables](../cis_v120/docs/variables.md) for defining both the common and tag dimensions. Each can be passed in several ways:

1. Environment variables:
```bash
export PP_VAR_common_dimensions='["domain", "connection_name"]'
export PP_VAR_tag_dimensions='["Environment", "Owner"]'
```

2. Powerpipe.ppvars file:
```hcl
common_dimensions = ["domain", "connection_name"]
tag_dimensions = ["Environment", "Owner"]
```

3. Command-line arguments:
```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120 \
  --var 'common_dimensions=["domain", "connection_name"]'
```

### Requirements

- [Powerpipe](https://powerpipe.io/downloads)
- [Steampipe](https://steampipe.io/downloads)
- [Google Workspace plugin for Steampipe](https://hub.steampipe.io/plugins/turbot/googleworkspace)

### Getting Started

Install Powerpipe:
```bash
brew install turbot/tap/powerpipe
```

Install Steampipe:
```bash
brew install turbot/tap/steampipe
steampipe plugin install googleworkspace
```

Clone this repository:
```bash
git clone https://github.com/turbot/steampipe-mod-googleworkspace-compliance.git
cd steampipe-mod-googleworkspace-compliance
```

Start Steampipe as a service:
```bash
steampipe service start
```

Run all benchmarks:
```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120
```

Run a specific benchmark:
```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120_1
```

### Credentials

This mod uses the credentials configured in the [Google Workspace plugin for Steampipe](https://hub.steampipe.io/plugins/turbot/googleworkspace).

### Implementation Notes

- Each control in this benchmark is implemented using SQL queries against the Steampipe Google Workspace plugin tables
- Controls return one of the following status values:
  - `ok` - The control check passed
  - `alarm` - The control check failed
  - `info` - The control check found something that should be reviewed
  - `skip` - The control check was skipped

### References

- [CIS Google Workspace Benchmark v1.2.0](https://www.cisecurity.org/benchmark/google_workspace)
- [Google Workspace Security Best Practices](https://support.google.com/a/answer/7587183)
- [Google Workspace Admin Console](https://admin.google.com) 