
select
  -- Required columns
  domain_name as resource,
  'info' as status,
  'Manual verification required.' as reason
from
  googledirectory_domain;
