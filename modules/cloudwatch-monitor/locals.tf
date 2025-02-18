
locals {
  sns_topic = format("%s-Sctv-Loki-Gateway-SNS-PagerDuty-integration-%s", var.distribution_id, var.env)
  pagerduty_endpoint= "https://events.pagerduty.com/integration/${var.pagerduty_integration_key}/enqueue"

  default_comparison_operator = "GreaterThanOrEqualToThreshold"
  default_evaluation_periods  = 1
  default_period = 60
  default_statistic = "Average"
  default_threshold = 5
}