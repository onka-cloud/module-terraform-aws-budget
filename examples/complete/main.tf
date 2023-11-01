
module "sns_topic" {
  source  = "boldlink/sns/aws"
  version = "1.1.1"
  name    = var.name
}

module "complete_example" {
  source            = "../../"
  name              = var.name
  budget_type       = "COST"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2023-01-01_00:00"
  time_period_end   = "2023-12-30_00:00"

  cost_filter = [
    {
      name = "Service"
      values = [
        "Amazon Elastic Compute Cloud - Compute",
      ]
    }
  ]

  auto_adjust_data = {
    auto_adjust_type = "HISTORICAL"
    historical_options = {
      budget_adjustment_period = 3
    }
  }

  cost_types = {
    include_credit             = false
    include_discount           = false
    include_other_subscription = false
    include_recurring          = false
    include_refund             = false
    include_subscription       = false
    include_support            = false
    include_tax                = false
    include_upfront            = false
    use_amortized              = false
    use_blended                = false
  }

  notification = [
    {
      comparison_operator        = "GREATER_THAN"
      threshold                  = 50
      threshold_type             = "PERCENTAGE"
      notification_type          = "ACTUAL"
      subscriber_email_addresses = [local.email]
      subscriber_sns_topic_arns  = [module.sns_topic.arn]
    },
    {
      comparison_operator        = "GREATER_THAN"
      threshold                  = 75
      threshold_type             = "PERCENTAGE"
      notification_type          = "ACTUAL"
      subscriber_email_addresses = [local.email]
    }
  ]
}

## Planned Limit
module "planned_limit" {
  source        = "../../"
  name          = "${var.name}-planned-limit"
  budget_type   = "COST"
  time_unit     = "MONTHLY"
  planned_limit = var.planned_limit
}

# Limit amount
module "limit_amount" {
  source       = "../../"
  name         = "${var.name}-limit-amount"
  budget_type  = "COST"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"
  limit_amount = 100
}
