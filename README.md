# Google Workspace Compliance Mod for Powerpipe

Run individual controls or full compliance benchmarks for CIS across your Google Workspace organization using Powerpipe and Steampipe.

## Getting Started

### Installation

Install Powerpipe (https://powerpipe.io/downloads), or use Brew:

```bash
brew install turbot/tap/powerpipe
```

Install the Google Workspace plugin with [Steampipe](https://steampipe.io):

```bash
steampipe plugin install googleworkspace
```

Clone:

```bash
git clone https://github.com/turbot/steampipe-mod-googleworkspace-compliance.git
cd steampipe-mod-googleworkspace-compliance
```

### Usage

Start your dashboard server:

```bash
powerpipe server
```

Browse and view your dashboards at **http://localhost:9033**.

Run a benchmark:

```bash
powerpipe benchmark run googleworkspace_compliance.benchmark.cis_v120
```

Run a specific control:

```bash
powerpipe control run googleworkspace_compliance.control.cis_v120_1_1_1
```

### Configuration

Configure your Google Workspace credentials in `~/.steampipe/config/googleworkspace.spc`:

```hcl
connection "googleworkspace" {
  plugin = "googleworkspace"
  
  # Authentication information
  credentials = "~/.config/gcloud/application_default_credentials.json"
  
  # Your Google Workspace domain
  domain = "yourdomain.com"
}
```

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod,
please fork the repository and submit a PR.