query "gmail_delegation_disabled" {
  sql = <<-EOQ
    with all_users as (
      select primary_email as user_email from googledirectory_user
    ),
    gmail_settings as (
      select 
        u.user_email,
        gs.delegates
      from all_users u
      left join googleworkspace_gmail_settings gs on gs.user_email = u.user_email
    )
    select
      user_email as resource,
      case
        when delegates is null or jsonb_array_length(delegates) = 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when delegates is null or jsonb_array_length(delegates) = 0 then 'No mailbox delegation configured for user: ' || user_email
        else 'Mailbox delegation is enabled for user: ' || user_email || ' with ' || jsonb_array_length(delegates) || ' delegate(s)'
      end as reason
    from
      gmail_settings;
  EOQ
}

query "gmail_pop_imap_disabled" {
  sql = <<-EOQ
    with all_users as (
      select primary_email as user_email from googledirectory_user
    ),
    gmail_settings as (
      select 
        u.user_email,
        gs.pop,
        gs.imap
      from all_users u
      left join googleworkspace_gmail_settings gs on gs.user_email = u.user_email
    )
    select
      user_email as resource,
      case
        when (pop ->> 'accessWindow' = 'disabled' or pop ->> 'accessWindow' is null)
        and (imap ->> 'enabled' = 'false' or imap ->> 'enabled' is null) then 'ok'
        else 'alarm'
      end as status,
      case
        when (pop ->> 'accessWindow' = 'disabled' or pop ->> 'accessWindow' is null)
        and (imap ->> 'enabled' = 'false' or imap ->> 'enabled' is null) then 'POP and IMAP access disabled for user: ' || user_email
        when pop ->> 'accessWindow' != 'disabled' and pop ->> 'accessWindow' is not null then 'POP access enabled for user: ' || user_email || ' (access window: ' || (pop ->> 'accessWindow') || ')'
        when imap ->> 'enabled' = 'true' then 'IMAP access enabled for user: ' || user_email
        else 'POP or IMAP access may be enabled for user: ' || user_email
      end as reason
    from
      gmail_settings;
  EOQ
}

query "gmail_auto_forwarding_disabled" {
  sql = <<-EOQ
    with all_users as (
      select primary_email as user_email from googledirectory_user
    ),
    gmail_settings as (
      select 
        u.user_email,
        gs.auto_forwarding
      from all_users u
      left join googleworkspace_gmail_settings gs on gs.user_email = u.user_email
    )
    select
      user_email as resource,
      case
        when auto_forwarding ->> 'enabled' = 'false' or auto_forwarding ->> 'enabled' is null then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_forwarding ->> 'enabled' = 'false' or auto_forwarding ->> 'enabled' is null then 'Auto-forwarding disabled for user: ' || user_email
        else 'Auto-forwarding enabled for user: ' || user_email || ' to: ' || coalesce(auto_forwarding ->> 'emailAddress', 'unknown address')
      end as reason
    from
      gmail_settings;
  EOQ
} 