- dashboard: dash_a
  title: Dash A
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  description: ''
  preferred_slug: QdDv02JaLxRDVklO4VNBJk
  elements:
  - title: Orders para Dashboards A
    name: Orders para Dashboards A
    model: balcazartest1
    explore: order_items
    type: looker_column
    fields: [orders.count, orders.status, orders.created_month]
    pivots: [orders.status]
    fill_fields: [orders.created_month]
    filters:
      orders.status: cancelled,complete,pending
    sorts: [orders.status, orders.created_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields:
    listen:
      Created Year: orders.created_year
    row: 0
    col: 0
    width: 24
    height: 9
  - type: button
    name: button_531
    rich_content_json: '{"text":"Ordes by Age","description":"Dashboard B","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://gcpl2214.cloud.looker.com/dashboards/261&f[orders.created_year]={{ value }}" }'
    row: 9
    col: 0
    width: 24
    height: 1
  filters:
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: '2017'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: balcazartest1
    explore: order_items
    listens_to_filters: []
    field: orders.created_year
