# Google Workspace Compliance Mod

Run individual configuration, compliance and security controls or full CIS compliance benchmarks across all your Google Workspace organization using Powerpipe and Steampipe.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-googleworkspace-compliance/main/docs/images/googleworkspace_cis_v120_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-googleworkspace-compliance/main/docs/images/googleworkspace_cis_v120_console.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-googleworkspace-compliance/main/docs/images/googleworkspace_compliance.png" width="50%" type="thumbnail"/>

## Documentation

- **[Benchmarks and controls →](https://hub.powerpipe.io/mods/turbot/googleworkspace_compliance/controls)**
- **[Named queries →](https://hub.powerpipe.io/mods/turbot/googleworkspace_compliance/queries)**

## Getting Started

### Installation

Install Powerpipe (https://powerpipe.io/downloads), or use Brew:

```bash
brew install turbot/tap/powerpipe
```

This mod requires [Steampipe](https://steampipe.io) with the [Google Workspace plugin](https://hub.steampipe.io/plugins/turbot/googleworkspace) and the [Google Directory plugin](https://hub.steampipe.io/plugins/turbot/googledirectory) as the data source. Install Steampipe (https://steampipe.io/downloads), or use Brew:

```bash
brew install turbot/tap/steampipe
steampipe plugin install googleworkspace
steampipe plugin install googledirectory
```

Finally, install the mod:

```bash
mkdir dashboards
cd dashboards
powerpipe mod init
powerpipe mod install github.com/turbot/steampipe-mod-googleworkspace-compliance
```

### Browsing Dashboards

Start Steampipe as the data source:

```bash
steampipe service start
```

Start the dashboard server:

```bash
powerpipe server
```

Browse and view your dashboards at **http://localhost:9033**.

### Running Checks in Your Terminal

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `powerpipe benchmark` command:

List available benchmarks:

```bash
powerpipe benchmark list
```

Run a benchmark:

```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120
```

Different output formats are also available, for more information please see
[Output Formats](https://powerpipe.io/docs/reference/cli/benchmark#output-formats).

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Steampipe](https://steampipe.io) and [Powerpipe](https://powerpipe.io) are products produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). They are distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [Google Workspace Compliance Mod](https://github.com/turbot/steampipe-mod-googleworkspace-compliance/labels/help%20wanted) 