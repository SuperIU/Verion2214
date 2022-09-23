view: fakeorders_suggestions {
    sql_table_name: demo_db.fakeorders ;;

    dimension: customer_id {
      type: string
      hidden: yes
      sql: ${TABLE}.customer_id ;;
    }

    dimension: order_id {
      type: number
      hidden: yes
      sql: ${TABLE}.order_id ;;
    }
}
