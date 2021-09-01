select
  -- Required Columns
  name as resource,
  case
    when not domain_users_only then 'alarm'
    else 'ok'
  end as status,
  case
    when not domain_users_only then 'google drive can be shared to external domain users.'
    else 'google not shared to external domain users.'
  end as reason,
  -- Additional Dimensions
  a.domain_name
from
  googleworkspace_drive,
  googledirectory_domain a;