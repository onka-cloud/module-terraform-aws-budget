# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- fix: CKV2_GHA_1: "Ensure top-level permissions are not set to write-all" and remove .checkov.yml
- feat: Show use of other `cost_filter` types in example
- feat: Add budget action features (to perform action on AWS resources when threshold is reached)

## [1.0.2] - 2023-10-27
- added subscriber_sns_topic_arns in complete example
- added planned limit budget in complete example
- added an example that has a limit amount in complete example
- remove lookback_available_periods from historical_options dynamic block as the value is automatically calculated from the budget_adjustment_period and historical cost data

## [1.0.1] - 2023-01-16
### Description
- fix: modified email used in examples

## [1.0.0] - 2023-01-11
### Description
- feat: Multiple notifications for different thresholds
- feat: Auto adjust limit amount based on historical or forecasted data
- feat: planned limit for filtering costs for a whole year (12 months) or 4 quarters
- feat: cost filter for specified AWS services

[Unreleased]: https://github.com/boldlink/terraform-aws-budget/compare/1.0.2...HEAD

[1.0.2]: https://github.com/boldlink/terraform-aws-budget/releases/tag/1.0.2
[1.0.1]: https://github.com/boldlink/terraform-aws-budget/releases/tag/1.0.1
[1.0.0]: https://github.com/boldlink/terraform-aws-budget/releases/tag/1.0.0
