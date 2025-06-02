mod "googleworkspace_compliance" {
  # Hub metadata
  title         = "Google Workspace Compliance"
  description   = "Run individual controls or full compliance benchmarks for CIS across your Google Workspace organization using Powerpipe and Steampipe."
  color         = "#4285F4"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/googleworkspace-compliance.svg"
  categories    = ["googleworkspace", "cis", "compliance", "security"]

  opengraph {
    title       = "Powerpipe Mod for Google Workspace Compliance"
    description = "Run individual controls or full compliance benchmarks for CIS across your Google Workspace organization using Powerpipe and Steampipe."
    image       = "/images/mods/turbot/googleworkspace-compliance-social-graphic.png"
  }

  require {
    plugin "googleworkspace" {
      min_version = "1.0.0"
    }
    plugin "googledirectory" {
      min_version = "1.0.0"
    }
  }
} 