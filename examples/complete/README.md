[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-budget/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-budget.svg)](https://github.com/boldlink/terraform-aws-budget/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-budget/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-budget/actions)


[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module example of the complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete_example"></a> [complete\_example](#module\_complete\_example) | ../../ | n/a |
| <a name="module_limit_amount"></a> [limit\_amount](#module\_limit\_amount) | ../../ | n/a |
| <a name="module_planned_limit"></a> [planned\_limit](#module\_planned\_limit) | ../../ | n/a |
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | boldlink/sns/aws | 1.1.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of a budget. Unique within accounts. | `string` | `"example-complete-budget"` | no |
| <a name="input_planned_limit"></a> [planned\_limit](#input\_planned\_limit) | Object containing Budget Notifications. Can be used multiple times to define more than one budget notification. | `any` | <pre>[<br>  {<br>    "amount": "100",<br>    "start_time": "2023-10-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2023-11-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2023-12-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-01-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-02-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-03-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-04-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-05-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-06-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-07-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-08-01_00:00",<br>    "unit": "USD"<br>  },<br>  {<br>    "amount": "100",<br>    "start_time": "2024-09-01_00:00",<br>    "unit": "USD"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
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

#### BOLDLink-SIG 2023
