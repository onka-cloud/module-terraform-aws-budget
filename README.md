[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-budget/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-budget.svg)](https://github.com/boldlink/terraform-aws-budget/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS Budget Terraform module

## Description

This module simplifies budget management by creating an AWS budget resource and providing an intuitive cost visualization feature powered by AWS Cost Explorer.

### Why choose this module
- This module has the following features:
  - Automatic adjustment of cost amounts based on historical averages and forecasted amounts
  - Customizable spending limits
  - Multiple notifications for various thresholds.
- Easy to set up and use, with clear instructions and examples available.
- Saves time and resources by automating budget management.
- Adheres to AWS security standards through the use of checkov, which scans the code to ensure compliance.

### Things to Note before using the module
#### Planned_limit
- "For the planned limit feature, data must be supplied for the next 12 months if utilizing a monthly projection, or 4 quarters if utilizing a quarterly projection. The start time should be provided in the format YYYY-MM-DD_HH:MM.",

for example
```hcl
module "budget" {
  source      = "boldlink/budget/aws"
  name        = "planned_limit_budget"
  budget_type = "COST"
  limit_unit  = "USD"
  time_unit   = "MONTHLY"

  planned_limit = [
    {
      start_time = "2023-01-01_00:00"
      amount     = 30
      unit       = "200"
    },

    ## `Other months here`

    {
      start_time = "2023-12-01_00:00"
      amount     = 30
      unit       = "200"
    }
  ]
}
```
#### Notification
- Only one of `subscriber_email_addresses` or `subscriber_sns_topic_arns` must be provided.

#### Auto Adjust Data
- Enabling this feature **overrides any previously set limit amount**. This is because when both are specified, Terraform will always detect a change in the next application. This is because when using the auto-adjust feature, the limit amount is determined by the average cost of the provided time period.

#### Module Examples
Examples are available [`here`](./examples)

**NOTE**: These examples utilize the most recent version of this module. To do so, specify the source without including a version number, as demonstrated below.

## Getting Started
- Install the module by running `terraform init`
- Configure the module by providing the necessary data in the `module` block, as shown in the example below.
- Run `terraform apply` to create the budget resource.
- Use the cost visualization feature in AWS Cost Explorer to monitor your account's costs.

```hcl
module "minimum_example" {
  source            = "boldlink/budget/aws"
  name              = local.name
  budget_type       = "COST"
  limit_amount      = "300"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2023-01-01_00:00"
  time_period_end   = "2023-02-28_00:00"

  notification = [
    {
      comparison_operator        = "GREATER_THAN"
      threshold                  = 50
      threshold_type             = "PERCENTAGE"
      notification_type          = "ACTUAL"
      subscriber_email_addresses = [local.email]
    }
  ]
}
```
## Documentation

[Amazon Budget Documentation](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_Budget.html#)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The ID of the target account for budget. Will use current user's account\_id by default if omitted | `number` | `null` | no |
| <a name="input_auto_adjust_data"></a> [auto\_adjust\_data](#input\_auto\_adjust\_data) | The parameters that determine the budget amount for an auto-adjusting budget. | `any` | `{}` | no |
| <a name="input_budget_type"></a> [budget\_type](#input\_budget\_type) | Whether this budget tracks monetary cost or usage. Valid values include `COST`, `USAGE`, `SAVINGS_PLANS_UTILIZATION`, `RI_UTILIZATION` | `string` | n/a | yes |
| <a name="input_cost_filter"></a> [cost\_filter](#input\_cost\_filter) | A list of CostFilter name/values pair to apply to budget. RI UtilizatioSn plans require a service cost filter to be set | `any` | `[]` | no |
| <a name="input_cost_types"></a> [cost\_types](#input\_cost\_types) | Object containing CostTypes The types of cost included in a budget, such as tax and subscriptions. Cost types must be defined for RI budgets because the settings conflict with the defaults | `map(string)` | `{}` | no |
| <a name="input_limit_amount"></a> [limit\_amount](#input\_limit\_amount) | The amount of cost or usage being measured for a budget. | `number` | `null` | no |
| <a name="input_limit_unit"></a> [limit\_unit](#input\_limit\_unit) | The unit of measurement used for the budget forecast, actual spend, or budget threshold, such as USD or GBP. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of a budget. Unique within accounts. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The prefix of the name of a budget. Unique within accounts. | `string` | `null` | no |
| <a name="input_notification"></a> [notification](#input\_notification) | Object containing Budget Notifications. | `any` | `[]` | no |
| <a name="input_planned_limit"></a> [planned\_limit](#input\_planned\_limit) | Object containing Budget Notifications. Can be used multiple times to define more than one budget notification. | `any` | `[]` | no |
| <a name="input_time_period_end"></a> [time\_period\_end](#input\_time\_period\_end) | The end of the time period covered by the budget. There are no restrictions on the end date. `Format: 2017-01-01_12:00`. | `string` | `null` | no |
| <a name="input_time_period_start"></a> [time\_period\_start](#input\_time\_period\_start) | The start of the time period covered by the budget. If you don't specify a start date, AWS defaults to the start of your chosen time period. The start date must come before the end date. `Format: 2017-01-01_12:00`. | `string` | `null` | no |
| <a name="input_time_unit"></a> [time\_unit](#input\_time\_unit) | The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY, and DAILY. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the budget. |
| <a name="output_id"></a> [id](#output\_id) | id of resource. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```

#### BOLDLink-SIG 2023
