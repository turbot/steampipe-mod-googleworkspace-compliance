-- Not applicable in domain level
select
  user_email as resource,
  -- Required Columns
  case
    when imap ->> 'enabled' = 'false' and pop ->> 'accessWindow' = 'disabled' then 'ok'
    else 'alarm'
  end as status,
  user_email || ' current setting for imap ' || (imap ->> 'enabled') || ' and for pop setting ' || (pop ->> 'accessWindow') || '.' as reason,
  -- Additional Dimensions
  a.domain_name
from
  googleworkspace_gmail_my_settings,
  googledirectory_domain a;