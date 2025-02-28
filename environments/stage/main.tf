module "cloudwatch_monitor_module" {
  source                    = "../../modules/new-module"
  env                       = var.env
  general_tags              = var.general_tags
  distribution_id           = var.distribution_id
  pagerduty_integration_key = var.pagerduty_integration_key
  slack_channel_id          = var.slack_channel_id
  slack_workspace_id        = var.slack_workspace_id
  alarms = var.alarms
  providers = {
    awscc.awsccnew =  awscc.awscc-provider
  }
}
