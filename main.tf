resource "oci_opsi_news_report" "opsi_news_reports" {
  for_each = var.opsi_news_reports

  compartment_id                  = each.value.compartment_id
  description                     = each.value.description
  locale                          = each.value.locale
  name                            = each.value.name
  news_frequency                  = each.value.news_frequency
  ons_topic_id                    = each.value.ons_topic_id
  are_child_compartments_included = each.value.are_child_compartments_included
  day_of_week                     = each.value.day_of_week
  defined_tags                    = each.value.defined_tags
  freeform_tags                   = each.value.freeform_tags
  match_rule                      = each.value.match_rule
  status                          = each.value.status
  tag_filters                     = each.value.tag_filters

  content_types {
    actionable_insights_resources                  = each.value.content_types.actionable_insights_resources
    capacity_planning_resources                    = each.value.content_types.capacity_planning_resources
    sql_insights_fleet_analysis_resources          = each.value.content_types.sql_insights_fleet_analysis_resources
    sql_insights_performance_degradation_resources = each.value.content_types.sql_insights_performance_degradation_resources
    sql_insights_plan_changes_resources            = each.value.content_types.sql_insights_plan_changes_resources
    sql_insights_top_databases_resources           = each.value.content_types.sql_insights_top_databases_resources
    sql_insights_top_sql_by_insights_resources     = each.value.content_types.sql_insights_top_sql_by_insights_resources
    sql_insights_top_sql_resources                 = each.value.content_types.sql_insights_top_sql_resources
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

