module "complete_example" {
  source            = "../../"
  name              = local.name
  budget_type       = "COST"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2023-01-01_00:00"
  time_period_end   = "2023-06-30_00:00"

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
  }

  notification = [
    {
      comparison_operator        = "GREATER_THAN"
      threshold                  = 50
      threshold_type             = "PERCENTAGE"
      notification_type          = "ACTUAL"
      subscriber_email_addresses = [local.email]
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
