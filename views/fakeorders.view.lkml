view: fakeorders {
  sql_table_name: demo_db.fakeorders ;;

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_price {
    type: number
    sql: ${TABLE}.order_price ;;
  }

  dimension: order_price_dsc {
    type: number
    sql: ${TABLE}.order_price-1;;
  }

  dimension: ontime {
    type: yesno
    sql: ${order_id} < 100 ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.id]
  }

  measure: kpi_actual_over_target_pct {
    group_label: "Compare Actuals and Targets"
    label: "Actual vs. Target %"
    description: "Actual amount divided by target amount."
    type: number
    value_format_name: percent_0
    sql: ${order_price}/nullif(${order_price_dsc}, 0) ;;
    required_fields: [ontime]
    html:
    {% if kpi_actual_over_target_pct._value >= 1.5 and ontime._value == 'No' %}
      <p style="background-color: #c6ecc6">{{ rendered_value }}</p>
    {% elsif kpi_actual_over_target_pct._value < 1.5 and kpi_actual_over_target_pct._value >= 1.1 and ontime._value == 'No' %}
      <p style="background-color: #ffffcc">{{ rendered_value }}</p>
    {% elsif kpi_actual_over_target_pct._value < 1.1 and ontime._value == 'No' %}
      <p style="background-color: #ffad99">{{ rendered_value }}</p>
    {% elsif kpi_actual_over_target_pct._value <= 1.1 and ontime._value == 'Yes' %}
      <p style="background-color: #c6ecc6">{{ rendered_value }}</p>
    {% elsif kpi_actual_over_target_pct._value > 1.1 and kpi_actual_over_target_pct._value <= 1.5 and ontime._value == 'Yes' %}
      <p style="background-color: #ffffcc">{{ rendered_value }}</p>
    {% elsif kpi_actual_over_target_pct._value > 1.5 and ontime._value == 'Yes' %}
      <p style="background-color: #ffad99">{{ rendered_value }}</p>
    {% else %}
      {{ rendered_value }}
    {% endif %} ;;
  }

}
