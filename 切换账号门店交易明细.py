import pandas as pd
from impala.dbapi import connect
from impala.util import as_pandas

start_time = pd.to_datetime('2021-05-16')
for i in range(15):

    timedelta = pd.to_timedelta(1, unit='d')
    print(start_time.strftime("%Y%m%d"))
    temp_sql = " SELECT * FROM (SELECT first_level_category_name,product_name,spu_sn, order_date,store_id,user_id,open_id,\
SUM(qty) as sum_qty FROM dw_detail.t_trade_order_item_area WHERE dt = '" + start_time.strftime("%Y%m%d") + "' AND store_name NOT LIKE '%食堂%' \
AND province = '湖南省' GROUP BY open_id,user_id, store_id, first_level_category_name, product_name, spu_sn, store_name, order_date) a \
INNER JOIN (SELECT user_limit_qty, spu_sn from ods_mysql_promotion.t_activity_preproduct ) b \
ON a.spu_sn = b.spu_sn WHERE b.user_limit_qty <= a.sum_qty ORDER By first_level_category_name  "

    print(temp_sql)
    conn = connect(host='172.21.195.22', port=10000, database='dw_detail', user='liyufan', password='Liyf#001001',
                   auth_mechanism='PLAIN')
    cursor = conn.cursor()
    cursor.execute(temp_sql)
    temp_df = as_pandas(cursor)
    temp_df.to_csv('data/' + start_time.strftime("%Y%m%d") + '.csv')
    conn.close()
    start_time = start_time + timedelta