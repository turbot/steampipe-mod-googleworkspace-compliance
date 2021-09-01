select
  -- Required Columns
  full_name as resource,
  case
    when is_enrolled_in_2sv and is_enforced_in_2sv then 'ok'
    else 'alarm'
  end as status,
  case
    when is_enrolled_in_2sv and is_enforced_in_2sv then full_name || ' enforced with multi-factor Authentication.'
    else full_name || ' multi-factor Authentication not enforced.'
  end as reason,
  -- Required Dimentions
  a.domain_name
from
  googledirectory_user,
  googledirectory_domain a;
