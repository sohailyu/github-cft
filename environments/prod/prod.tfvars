target_account_id          = "412380549428" # aws-smartcast-services-prod
region                     = "us-east-1"
env                        = "prod"

distribution_id = "E1WE3BKSLOJF6R"
pagerduty_integration_key = "d0e18017b6624009c05e66b02ea7eae0"
slack_channel_id = "C060EA1C5PE"  //#loki-gateway-alerts
slack_workspace_id = "T0733TMPZ"   // Also known as TeamID


alarms = {
  # Requests2mAverage = {
  #   metric_name         = "Requests"
  #   comparison_operator = "GreaterThanThreshold"
  #   evaluation_periods  = 1
  #   period              = 300
  #   statistic           = "Average"
  #   threshold           = 12000
  # }
  DailyRequests = {
    metric_name         = "Requests"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 86400
    statistic           = "Sum"
    threshold           = 3000000000
  }
  Requests5mSum = {
    metric_name         = "Requests"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 300
    statistic           = "Sum"
    threshold           = 23500000
  }
  # BytesDownloaded2mAverage = {
  #   metric_name         = "BytesDownloaded"
  #   comparison_operator = "GreaterThanThreshold"
  #   evaluation_periods  = 1
  #   period              = 120
  #   statistic           = "Average"
  #   threshold           = 2280000000
  # }
  BytesDownloaded5mAverage = {
    metric_name         = "BytesDownloaded"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 300
    statistic           = "Average"
    threshold           = 16000000
  }
  DailyBytesDownloaded = {
    metric_name         = "BytesDownloaded"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 86400
    statistic           = "Sum"
    threshold           = 70000000000000
  }
  TotalErrorRate = {
    metric_name         = "TotalErrorRate"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 120
    statistic           = "Average"
    threshold           = 2
  }
  ErrorRate4xx = {
    metric_name         = "4xxErrorRate"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 120
    statistic           = "Average"
    threshold           = 1.75
  }
  ErrorRate5xx = {
    metric_name         = "5xxErrorRate"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 120
    statistic           = "Average"
    threshold           = 0.5
  }
  CacheHitRate = {
    metric_name         = "CacheHitRate"
    comparison_operator = "LessThanThreshold"
    evaluation_periods  = 1
    period              = 300
    statistic           = "Average"
    threshold           = 70
  }
  OriginLatency = {
    metric_name         = "OriginLatency"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 300
    statistic           = "Average"
    threshold           = 500
  }

}