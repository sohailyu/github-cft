
resource "aws_iam_role" "sns-assume" {
  name  = "${var.distribution_id}-SNS-ASSUME-role-sctv-loki-gateway-${var.env}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      }
    }
  ]
}
EOF
 tags = merge(
    var.general_tags, {
    "resource_type" = "iam-role"
    "environment" = "${var.env}"
    }
 )
}

data "aws_iam_policy_document" "logs" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutMetricFilter",
      "logs:PutRetentionPolicy"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "sns-logs" {
  name   = "${var.distribution_id}-sctv-loki-gateway-SNS-LOGS-policy--${var.env}"
  policy = data.aws_iam_policy_document.logs.json
}

resource "aws_iam_role_policy_attachment" "sns-logs" {
  role       = aws_iam_role.sns-assume.name
  policy_arn = aws_iam_policy.sns-logs.arn
}