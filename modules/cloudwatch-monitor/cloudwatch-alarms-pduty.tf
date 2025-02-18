resource "aws_sns_topic" "topic" {
  name            = local.sns_topic

  http_success_feedback_role_arn = aws_iam_role.sns-assume.arn
  http_failure_feedback_role_arn = aws_iam_role.sns-assume.arn

  delivery_policy = jsonencode({
    "http" : {
      "defaultHealthyRetryPolicy" : {
        "minDelayTarget" : 20,
        "maxDelayTarget" : 20,
        "numRetries" : 3,
        "numMaxDelayRetries" : 0,
        "numNoDelayRetries" : 0,
        "numMinDelayRetries" : 0,
        "backoffFunction" : "linear"
      },
      "disableSubscriptionOverrides" : false,
      "defaultThrottlePolicy" : {
        "maxReceivesPerSecond" : 1
      }
    }
  })
   tags = merge(
    var.general_tags, {
    "resource_type" = "sns-topic"
    "environment" = "${var.env}"
    }
 )
}

data "aws_arn" "sns-topic" {
  arn = aws_sns_topic.topic.arn
}

data "aws_iam_policy_document" "sns" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish"
    ]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceOwner"
      values = [data.aws_arn.sns-topic.account]
    }

    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
    resources = [aws_sns_topic.topic.arn]
    sid       = "__default_statement_ID"
  }

  statement {
    sid    = "AWSBudgets"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }
    actions = [
      "SNS:Publish"
    ]
    resources = [data.aws_arn.sns-topic.arn]
  }
}

resource "aws_sns_topic_policy" "sns" {
  arn    = aws_sns_topic.topic.arn
  policy = data.aws_iam_policy_document.sns.json
}

resource "aws_sns_topic_subscription" "pagerduty" {
  topic_arn              = aws_sns_topic.topic.arn
  protocol               = "https"
  endpoint               = local.pagerduty_endpoint
  endpoint_auto_confirms = true
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  count = length(var.alarms)

  alarm_name = format("%s-%s-%s-%s",
    "sctv-loki-apigateway-cdn",var.distribution_id,
    element(keys(var.alarms), count.index), var.env
  )

  namespace   = "AWS/CloudFront"
  metric_name = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "metric_name"
  )

  dimensions = {
    DistributionId = var.distribution_id
    Region         = "Global"
  }

  comparison_operator = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "comparison_operator",
    local.default_comparison_operator
  )

  evaluation_periods = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "evaluation_periods",
    local.default_evaluation_periods
  )

  period = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "period",
    local.default_period
  )

  statistic = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "statistic",
    local.default_statistic
  )

  threshold = lookup(
    var.alarms[element(keys(var.alarms), count.index)],
    "threshold",
    local.default_threshold
  )

  actions_enabled = true
  alarm_actions = [aws_sns_topic.topic.arn]
}