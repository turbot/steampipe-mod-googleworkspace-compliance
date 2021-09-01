---
repository: "https://github.com/turbot/steampipe-mod-googleworkspace-compliance"
---

# Google Worksapce Compliance Mod

Run individual configuration, compliance and security controls or full CIS compliance benchmarks for all your Google Workspace.

## References
[Google Workspace](https://workspace.google.com/) is a collection of cloud computing, productivity and collaboration tools, software and products developed and marketed by Google.

[CIS Google Workspace Foundations](https://www.cisecurity.org/benchmark/google_workspace/) provide a predefined set of compliance and security best-practice checks for Google Workspace.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/googleworkspace_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/googleworkspace_compliance/queries)**

## Get started

Install the Google Workspace plugin with [Steampipe](https://steampipe.io):
```shell
steampipe plugin install googleworkspace
```

Clone:
```sh
git clone https://github.com/turbot/steampipe-mod-googleworkspace-compliance.git
cd steampipe-mod-googleworkspace-compliance
```

Run all benchmarks:
```shell
steampipe check all
```

Run a single benchmark:
```shell
steampipe check benchmark.cis_v100
```

Run a specific control:
```shell
steampipe check control.cis_v100_5_1
```

### Credentials

This mod uses the credentials configured in the [Steampipe Google Workspace plugin](https://hub.steampipe.io/plugins/turbot/googleworkspace).

### Configuration

No extra configuration is required.

## Get involved

* Contribute: [GitHub Repo](https://github.com/turbot/steampipe-mod-googleworkspace-compliance)
* Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
