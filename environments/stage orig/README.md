<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | 1.8.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch_monitor_module"></a> [cloudwatch\_monitor\_module](#module\_cloudwatch\_monitor\_module) | ../../modules/cloudwatch-monitor | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarms"></a> [alarms](#input\_alarms) | Alarms information.<br>    The keys of the map are the metric names.<br>    The values of the map contain the information for a metric alarm.<br><br>    The following arguments are supported:<br>      - metric\_name: Name of the CloudWatch alarm metric<br>      - comparison\_operator: The arithmetic operation to use when comparing the specified statistic and threshold.<br>        - GreaterThanOrEqualToThreshold <br>        - GreaterThanThreshold<br>        - LessThanOrEqualToThreshold<br>        - LessThanThreshold<br>      - evaluation\_periods: The number of periods over which data is compared to the specified threshold.<br>      - period: The period, in seconds, over which the statistic is applied. Valid values are 10, 30, 60, and any multiple of 60.<br>      - statistic: The statistic for the metric associated with the alarm, other than percentile.<br>        - Average <br>        - Maximum<br>        - Minimum<br>        - SampleCount<br>        - Sum <br>      - threshold: The value to compare with the specified statistic. | `map` | `{}` | no |
| <a name="input_distribution_id"></a> [distribution\_id](#input\_distribution\_id) | Cloudfront Distribution ID | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Provide name of the environment | `string` | n/a | yes |
| <a name="input_general_tags"></a> [general\_tags](#input\_general\_tags) | General tags can be used for any resource | `map(string)` | <pre>{<br>  "cost-center": "2720",<br>  "created-by": "devsecops",<br>  "function": "sctv-loki-services",<br>  "iac-repo": "vizio-devsecops-sctv-loki-monitor-infra",<br>  "service": "sctv-loki-gateway"<br>}</pre> | no |
| <a name="input_pagerduty_integration_key"></a> [pagerduty\_integration\_key](#input\_pagerduty\_integration\_key) | PagerDuty integration key for alarm notification | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Provide the AWS region-name | `string` | n/a | yes |
| <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id) | Enter the slack channerl id that you want to be alerted on | `string` | `"C06JAR9V4AV"` | no |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | Enter the slack workspace id | `string` | `"EST5V155Y"` | no |
| <a name="input_target_account_id"></a> [target\_account\_id](#input\_target\_account\_id) | Provide Target account id where aws resources will need to be created in | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_env"></a> [env](#output\_env) | n/a |
| <a name="output_target_account_id"></a> [target\_account\_id](#output\_target\_account\_id) | n/a |
<!-- END_TF_DOCS -->