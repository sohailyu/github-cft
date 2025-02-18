target_account_id          = "178936557468" # aws-smartcast-services-stage
region                     = "us-east-1"
env                        = "stage"

distribution_id = "E3RJTSGXVSPN7P"
pagerduty_integration_key = ""  //d0e18017b6624009c05e66b02ea7eae0 commented for stage
slack_channel_id = "C07TWMC0M4L"  //#loki-gateway-alerts-nonprod
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
    threshold           = 7000000
  }
  Requests5mSum = {
    metric_name         = "Requests"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    period              = 300
    statistic           = "Sum"
    threshold           = 72000
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
    threshold           = 5000000
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
    evaluation_periods  = 2
    period              = 120
    statistic           = "Average"
    threshold           = 75
  }
  ErrorRate4xx = {
    metric_name         = "4xxErrorRate"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 2
    period              = 120
    statistic           = "Average"
    threshold           = 75
  }
  ErrorRate5xx = {
    metric_name         = "5xxErrorRate"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 2
    period              = 120
    statistic           = "Average"
    threshold           = 30
  }
  # CacheHitRate = {
  #   metric_name         = "CacheHitRate"
  #   comparison_operator = "LessThanThreshold"
  #   evaluation_periods  = 1
  #   period              = 300
  #   statistic           = "Average"
  #   threshold           = 75
  # }
  # OriginLatency = {
  #   metric_name         = "OriginLatency"
  #   comparison_operator = "GreaterThanThreshold"
  #   evaluation_periods  = 1
  #   period              = 300
  #   statistic           = "Average"
  #   threshold           = 500
  # }

}