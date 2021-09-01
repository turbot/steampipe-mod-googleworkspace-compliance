-- This is applied only at user level access
select
  -- Required Columns
  user_email as resource,
  case
    when delegates is not null then 'alarm'
  else 'ok'
  end as status,
  case
    when delegates is not null then user_email || ' having delegation set to the mailbox.'
  else user_email || ' having no delegation to the mailbox.'
  end as reason,
  -- Required Columns
  a.domain_name
from
  googleworkspace_gmail_my_settings,
  googledirectory_domain a;