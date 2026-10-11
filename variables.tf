variable "opsi_news_reports" {
  description = <<EOT
Map of opsi_news_reports, attributes below
Required:
    - compartment_id
    - description
    - locale
    - name
    - news_frequency
    - ons_topic_id
    - content_types (block):
        - actionable_insights_resources (optional)
        - capacity_planning_resources (optional)
        - sql_insights_fleet_analysis_resources (optional)
        - sql_insights_performance_degradation_resources (optional)
        - sql_insights_plan_changes_resources (optional)
        - sql_insights_top_databases_resources (optional)
        - sql_insights_top_sql_by_insights_resources (optional)
        - sql_insights_top_sql_resources (optional)
Optional:
    - are_child_compartments_included
    - day_of_week
    - defined_tags
    - freeform_tags
    - match_rule
    - status
    - tag_filters
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id                  = string
    description                     = string
    locale                          = string
    name                            = string
    news_frequency                  = string
    ons_topic_id                    = string
    are_child_compartments_included = optional(bool)
    day_of_week                     = optional(string)
    defined_tags                    = optional(map(string))
    freeform_tags                   = optional(map(string))
    match_rule                      = optional(string)
    status                          = optional(string)
    tag_filters                     = optional(list(string))
    content_types = object({
      actionable_insights_resources                  = optional(list(string))
      capacity_planning_resources                    = optional(list(string))
      sql_insights_fleet_analysis_resources          = optional(list(string))
      sql_insights_performance_degradation_resources = optional(list(string))
      sql_insights_plan_changes_resources            = optional(list(string))
      sql_insights_top_databases_resources           = optional(list(string))
      sql_insights_top_sql_by_insights_resources     = optional(list(string))
      sql_insights_top_sql_resources                 = optional(list(string))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

