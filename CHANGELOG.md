# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- fix: CKV2_GHA_1: "Ensure top-level permissions are not set to write-all" and remove .checkov.yml
- feat: Show setting up with SNS topic
- feat: Show use of other `cost_filter` types in example
- feat: Show using planned_limit
- feat: Add butdge action features (to perform action on AWS resources when threshold is reached)

## [1.0.0] - 2023-01-11
### Description
- feat: Multiple notifications for different thresholds
- feat: Auto adjust limit amount based on historical or forecasted data
- feat: planned limit for filtering costs for a whole year (12 months) or 4 quarters
- feat: cost filter for specified AWS services

[Unreleased]: https://github.com/boldlink/terraform-aws-budget/compare/1.0.0...HEAD

[1.0.0]: https://github.com/boldlink/terraform-aws-budget/releases/tag/1.0.0
