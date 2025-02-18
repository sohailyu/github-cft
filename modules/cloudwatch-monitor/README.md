<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | 1.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>5.0 |
| <a name="provider_awscc.awsccnew"></a> [awscc.awsccnew](#provider\_awscc.awsccnew) | 1.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_policy.sns-logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.sns-assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.sns-logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.pagerduty](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [awscc_chatbot_slack_channel_configuration.scfs_cdn_slack](https://registry.terraform.io/providers/hashicorp/awscc/1.8.0/docs/resources/chatbot_slack_channel_configuration) | resource |
| [awscc_iam_role.chat_bot_role](https://registry.terraform.io/providers/hashicorp/awscc/1.8.0/docs/resources/iam_role) | resource |
| [aws_arn.sns-topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_iam_policy_document.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarms"></a> [alarms](#input\_alarms) | Alarms information.<br>    The keys of the map are the metric names.<br>    The values of the map contain the information for a metric alarm.<br><br>    The following arguments are supported:<br>      - metric\_name: Name of the CloudWatch alarm metric<br>      - comparison\_operator: The arithmetic operation to use when comparing the specified statistic and threshold.<br>        - GreaterThanOrEqualToThreshold <br>        - GreaterThanThreshold<br>        - LessThanOrEqualToThreshold<br>        - LessThanThreshold<br>      - evaluation\_periods: The number of periods over which data is compared to the specified threshold.<br>      - period: The period, in seconds, over which the statistic is applied. Valid values are 10, 30, 60, and any multiple of 60.<br>      - statistic: The statistic for the metric associated with the alarm, other than percentile.<br>        - Average <br>        - Maximum<br>        - Minimum<br>        - SampleCount<br>        - Sum <br>      - threshold: The value to compare with the specified statistic. | `map` | `{}` | no |
| <a name="input_distribution_id"></a> [distribution\_id](#input\_distribution\_id) | Cloudfront Distribution ID | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Provide name of the environment | `string` | n/a | yes |
| <a name="input_general_tags"></a> [general\_tags](#input\_general\_tags) | General tags can be used for any resource | `map(string)` | <pre>{<br>  "cost-center": "2720",<br>  "created-by": "devsecops",<br>  "function": "sctv-loki-services",<br>  "iac-repo": "vizio-devsecops-sctv-loki-monitor-infra",<br>  "service": "sctv-loki-gateway"<br>}</pre> | no |
| <a name="input_pagerduty_integration_key"></a> [pagerduty\_integration\_key](#input\_pagerduty\_integration\_key) | PagerDuty integration key for alarm notification | `string` | n/a | yes |
| <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id) | Enter the slack channerl id that you want to be alerted on | `string` | `"C06JAR9V4AV"` | no |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | Enter the slack workspace id | `string` | `"EST5V155Y"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->