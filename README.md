# vizio-devsecops-sctv-loki-monitor-infra
This Repo has Terraform code related to cloudwatch monitor alarms, slack and pagerduty integrations for sctv and loki applications.

## Goal of this project
* What are we acheiveing with this project using Terraform.
* Able to create SNS Topic and Iam Role for the SNS Topic.
* Able to build cloudwatch alarms.
* SNS Topic created above will be added as action for cloudwatch alarms.
* Pager Duty Endpoint will be added as subscriber to the SNS topic above.
* AWSchatbot service configuration will be created to integrate the SNS >> AWSchatbot >> Slack.

## project structure:
vizio-devsecops-sctv-loki-monitor-infra
╰─ tree

```bash                                                             
├── README.md
├── environments
│   ├── dev
│   │   ├── README.md
│   │   ├── backend.tf
│   │   ├── dev.tfvars
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── prod
│   │   └── prod.tfvars
│   └── stage
│       └── stage.tfvars
└── modules
    └── cloudwatch-monitor
        ├── README.md
        ├── cloudwatch-alarms-pduty.tf
        ├── iam.tf
        ├── locals.tf
        ├── main.tf
        ├── sns-slack.tf
        └── variables.tf
```

## Terraform Commands
terraform working directory: Terraform will run from each env folder based on the github action inputs that you select.
   >> working-directory: ./environments/${{inputs.env}}

$ terraform init

$ terraform plan -var-file=./${{inputs.env}}.tfvars  -input=false  -out=${{inputs.env}}-plan

$ terraform apply "${{inputs.env}}-plan"

## Terraform State file and stacklock resources are stored in below account###
aws-smartcast-shared account:760190395381

#### s3 bucket:
terraform-state-s3bucket-sctv-loki-cdn-shared

#### DynamoDb:
terraform-state-lock-table-sctv-loki-cdn-shared



## Terraform role below is assuming the target account roles to execute terraform commands.

##### aws-smartcast-shared account:
Iam Role- shared : github-actions-oidc-devsecops-terraform-sctv-loki-cdn-shared
#### Role ARN:
 arn:aws:iam::760190395381:role/github-actions-oidc-devsecops-terraform-sctv-loki-cdn-shared

#### Description: 
Github actions oidc role for sctv-loki  cdn monitoring project IAC code deployment

## Target Account IAM Roles:

#### Iam-Role-dev: 
arn:aws:iam::676644077888:role/github-actions-oidc-devsecops-terraform-sctv-loki-cdn-dev
*Note: Monitoring stack is not deployed into Dev Environment.

#### Description:
This Role is used for Terraform executions in this account. This is managed by DevSecOps for deploying the sctv-loki  cdn monitoring  IAC code in dev environment

##### Iam-Role-stage: 
arn:aws:iam::178936557468:role/github-actions-oidc-devsecops-terraform-sctv-loki-cdn-stage

#### Description:
This Role is used for Terraform executions in this account. This is managed by DevSecOps for deploying the sctv-loki cdn monitoring IAC code in stage environment.

##### Iam-Role-prod:  
arn:aws:iam::412380549428:role/github-actions-oidc-devsecops-terraform-sctv-loki-cdn-prod

#### Description:
This Role is used for Terraform executions in this account. This is managed by DevSecOps for deploying the sctv-loki cdn monitoring IAC code in prod environment.


### Tags applied to resources:
##### Example:
```bash

Key         Value
iac-repo	vizio-devsecops-sctv-loki-monitor-infra
env	        shared
service	    sctv-loki-gateway
created-by	devsecops
function	sctv-loki-services
cost-center	2720
```