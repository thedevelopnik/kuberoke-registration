include "root" {
  path = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git@github.com:Kuberoke/kuberoke-registration.git//terraform?ref=v1.0.0"
}

inputs = merge (
  include.root.locals.env,
  {
    ticket_codes = {
      invalid = "0"
      AWS_PARIS_24 = "6"
      FRIENDS_OF_KUBEROKE = "50"
      TESTIFYSEC_PARIS_24 = "6"
      CONTROLPLANE_PARIS_24 = "6"
      HONEYCOMB_PARIS_24 = "6"
    },
    sendgrid_api_key = get_env("SENDGRID_API_KEY")
    event_start_timestamp = "1710964800000"
    default_minutes_to_arrive = "50"
    email_config = yamldecode(file("email_config.yaml"))
  }
)