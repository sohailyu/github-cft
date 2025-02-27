variable "env" {
  description = "Provide name of the environment"
  type        = string
}

variable "target_account_id" {
  description = "Provide Target account id where aws resources will need to be created in"
  type        = number

}

variable "region" {
  description = "Provide the AWS region-name"
  type        = string

}

variable "general_tags" {
  description = "General tags can be used for any resource"
  type        = map(string)
  default = {
    "function"    = "sctv-loki-services"
    "created-by"  = "devsecops"
    "cost-center" = "2720"
    "service"     = "sctv-loki-gateway"
    "iac-repo"    = "vizio-devsecops-sctv-loki-monitor-infra"    
  }
}

variable "slack_channel_id" {
  description = "Enter the slack channerl id that you want to be alerted on"
  default = "C06JAR9V4AV"  //#loki-feature-flag-infra-alerts
  
}

variable "slack_workspace_id" {
  description = "Enter the slack workspace id"
  default = "EST5V155Y"   // Also known as TeamID
}

variable "distribution_id" {
  description = "Cloudfront Distribution ID"
  type = string  
}

variable "pagerduty_integration_key" {
  type        = string
  description = "PagerDuty integration key for alarm notification"
}

variable "alarms" {
  type        = map
  default     = {}
  description = <<EOF
    Alarms information.
    The keys of the map are the metric names.
    The values of the map contain the information for a metric alarm.

    The following arguments are supported:
      - metric_name: Name of the CloudWatch alarm metric
      - comparison_operator: The arithmetic operation to use when comparing the specified statistic and threshold.
        - GreaterThanOrEqualToThreshold 
        - GreaterThanThreshold
        - LessThanOrEqualToThreshold
        - LessThanThreshold
      - evaluation_periods: The number of periods over which data is compared to the specified threshold.
      - period: The period, in seconds, over which the statistic is applied. Valid values are 10, 30, 60, and any multiple of 60.
      - statistic: The statistic for the metric associated with the alarm, other than percentile.
        - Average 
        - Maximum
        - Minimum
        - SampleCount
        - Sum 
      - threshold: The value to compare with the specified statistic.
    EOF
}