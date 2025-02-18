resource "awscc_chatbot_slack_channel_configuration" "sctv_loki_cdn_slack" {
  provider = awscc.awsccnew
  configuration_name = "sctv-loki-gateway-cdn-slack-channel-config-${var.env}"
  iam_role_arn       = awscc_iam_role.chat_bot_role.arn
  slack_channel_id   = "${var.slack_channel_id}"
  slack_workspace_id = "${var.slack_workspace_id}"
  sns_topic_arns     = [aws_sns_topic.topic.arn]
}

resource "awscc_iam_role" "chat_bot_role" {
  provider = awscc.awsccnew
  role_name = "ChatBot-Channel-Role-Sctv-Loki-Gateway-cdn-${var.env}"
  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "chatbot.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSResourceExplorerReadOnlyAccess"]
}