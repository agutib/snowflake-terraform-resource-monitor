import snowflake.connector

conn = snowflake.connector.connect(
    user='SA_TF_RSM',
    password='tH3geynq',
    account='SP25153.AP-SOUTHEAST-1',
    warehouse='TF_VWH_3RD',
    database = 'TF_DEMO',
    schema = 'WAREHOUSE_CREDITS'
)

# Margie
cursor = conn.cursor()
cursor.execute("""
  select qo.WAREHOUSE_NAME as warehouse_name
  ,qo.MONITOR_NAME as resource_monitor
  ,qo.MONTHLY_ALLOCATION as credits_allocated
  ,sum(us.CREDITS_USED) as credits_consumed
  ,(credits_allocated - credits_consumed) as credits_remaining
  ,(credits_allocated + credits_remaining) as next_month_allocation
  from tf_demo.warehouse_credits.vwh_credit_quota qo
  left join snowflake.account_usage.warehouse_metering_history us
  on qo.WAREHOUSE_NAME = us.WAREHOUSE_NAME
  --where end_time between '2023-07-01' AND '2023-07-31'
  --where end_time between DATE_TRUNC('month', current_date()) AND last_day(CURRENT_DATE())
  --where end_time between DATE_TRUNC('month', current_date()) AND LAST_DAY(current_date())
  group by
    qo.WAREHOUSE_NAME
    ,qo.monitor_name
    ,credits_allocated
  order by WAREHOUSE_NAME asc;
""")

# Retrieve the remaining credits
column = cursor.fetchall()
for row in column:
    next_month_allocation = int(row[5])
    resource_monitor = row[1]

    sql_command = f"ALTER RESOURCE MONITOR {resource_monitor} SET CREDIT_QUOTA = {next_month_allocation}"
    cursor.execute(sql_command)
    
cursor.close()
conn.close()

#new_credit_quota =  credits_remaining

'''conn = snowflake.connector.connect(
    user='SA_TF_RSM',
    password='tH3geynq',
    account='SP25153.AP-SOUTHEAST-1',
    warehouse='TF_VWH_TEST',
    database = 'TF_DEMO',
    schema = 'WAREHOUSE_CREDITS'
)


cursor = conn.cursor()
cursor.execute(f"""
    ALTER RESOURCE MONITOR {resource_monitor} SET CREDIT_QUOTA = {credits};
""")
cursor.close()
conn.close()'''