variable "name" {
  type        = string
  description = "The name of a budget. Unique within accounts."
  default     = "example-complete-budget"
}

variable "planned_limit" {
  type        = any
  description = "Object containing Budget Notifications. Can be used multiple times to define more than one budget notification."
  default = [
    {
      start_time = "2023-10-01_00:00"
      amount     = "100"
      unit       = "USD"
    },

    {
      start_time = "2023-11-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2023-12-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-01-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-02-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-03-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-04-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-05-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-06-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-07-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-08-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
    ,

    {
      start_time = "2024-09-01_00:00"
      amount     = "100"
      unit       = "USD"
    }
  ]

}
