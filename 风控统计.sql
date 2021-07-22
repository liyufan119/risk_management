SELECT
group_type,
MIN(qty) as min_qty, 
MAX(qty) as max_qty,
MIN(gmv) as min_gmv,
MAX(gmv) as max_gmv,
MIN(store_profits) as min_store_profits,
MAX(store_profits) as max_store_profits,
MIN(platform_profits) as min_platform_profits,
MAX(platform_profits) as max_platform_profits,
AVG(qty) as avg_qty,
AVG(gmv) as avg_gmv,
AVG(store_profits) as avg_store_profits,
AVG(platform_profits) as avg_platform_profits,
STDDEV_POP(qty) as stddev_qty,
STDDEV_POP(gmv) as stddev_gmv,
STDDEV_POP(store_profits) as stddev_store_profit,
STDDEV_POP(platform_profits) as stddev_platform_profits,
VAR_POP (qty) as var_qty,
VAR_POP (gmv) as var_gmv,
VAR_POP (store_profits) as var_store_profits,
VAR_POP (platform_profits) as var_platform_profits
FROM edw_tmp.tmp_tag_20210616
WHERE city_id = '4301'   
GROUP BY group_type


#商品-门店聚集统计
SELECT
 store_id
,MIN(qty) as min_qty
,MAX(qty) as max_qty
,MIN(gmv) as min_gmv
,MAX(gmv) as max_gmv
,MIN(store_profits) as min_store_profits
,MAX(store_profits) as max_store_profits
,MIN(platform_profits) as min_platform_profits
,MAX(platform_profits) as max_platform_profits
,MIN(discount_amount) as min_discount_amount
,MAX(discount_amount) as max_discount_amount
,MIN(cut_profit_rate) as min_cut_profit_rate
,MAX(cut_profit_rate) as max_cut_profit_rate
,AVG(qty) as avg_qty
,AVG(gmv) as avg_gmv
,AVG(store_profits) as avg_store_profits
,AVG(platform_profits) as avg_platform_profits
,AVG(discount_amount) as avg_discount_amount
,AVG(cut_profit_rate) as avg_cut_profit_rate
,STDDEV_POP(qty) as stddev_qty
,STDDEV_POP(gmv) as stddev_gmv
,STDDEV_POP(store_profits) as stddev_store_profit
,STDDEV_POP(platform_profits) as stddev_platform_profits
,STDDEV_POP(discount_amount) as stddev_discount_amount
,STDDEV_POP(cut_profit_rate) as stddev_cut_profit_rate
,percentile_approx(qty, array(0.2,0.4,0.6,0.8), 9999) as qty_percentile
,percentile_approx(gmv, array(0.2,0.4,0.6,0.8), 9999) as gmv_percentile
,percentile_approx(store_profits, array(0.2,0.4,0.6,0.8), 9999) as store_profits_percentile
,percentile_approx(platform_profits, array(0.2,0.4,0.6,0.8), 9999) as platform_profits_percentile
,percentile_approx(discount_amount, array(0.2,0.4,0.6,0.8), 9999) as discount_amount_percentile
,percentile_approx(cut_profit_rate, array(0.2,0.4,0.6,0.8), 9999) as cut_profit_rate_percentile
FROM 
	(
	SELECT
		store_id
		,sku_sn
		,qty
		,gmv
		,store_profits
		,platform_profits
		,discount_amount
		,discount_amount/gmv as cut_profit_rate
	FROM edw_tmp.tmp_tag_20210616
	WHERE group_type = '111100'
	) a
GROUP BY store_id
	





#用户-门店聚集统计
SELECT
 user_id 
,MIN(qty) as min_qty
,MAX(qty) as max_qty
,MIN(gmv) as min_gmv
,MAX(gmv) as max_gmv
,MIN(store_profits) as min_store_profits
,MAX(store_profits) as max_store_profits
,MIN(platform_profits) as min_platform_profits
,MAX(platform_profits) as max_platform_profits
,AVG(qty) as avg_qty
,AVG(gmv) as avg_gmv
,AVG(store_profits) as avg_store_profits
,AVG(platform_profits) as avg_platform_profits
,STDDEV_POP(qty) as stddev_qty
,STDDEV_POP(gmv) as stddev_gmv
,STDDEV_POP(store_profits) as stddev_store_profit
,STDDEV_POP(platform_profits) as stddev_platform_profits
,percentile_approx(qty, array(0.2,0.4,0.6,0.8), 9999) as qty_percentile
,percentile_approx(gmv, array(0.2,0.4,0.6,0.8), 9999) as gmv_percentile
,percentile_approx(store_profits, array(0.2,0.4,0.6,0.8), 9999) as store_profits
,percentile_approx(platform_profits, array(0.2,0.4,0.6,0.8), 9999) as platform_profits
FROM 
	(
	SELECT
		store_id
		,user_id
		,qty
		,gmv
		,store_profits
		,platform_profits
	FROM edw_tmp.tmp_tag_20210616
	WHERE group_type = '111001'
	) a
GROUP BY user_id 

SELECT
 user_id 
,MIN(qty) as min_qty
,MAX(qty) as max_qty
,MIN(gmv) as min_gmv
,MAX(gmv) as max_gmv
,MIN(store_profits) as min_store_profits
,MAX(store_profits) as max_store_profits
,MIN(platform_profits) as min_platform_profits
,MAX(platform_profits) as max_platform_profits
,AVG(qty) as avg_qty
,AVG(gmv) as avg_gmv
,AVG(store_profits) as avg_store_profits
,AVG(platform_profits) as avg_platform_profits
,STDDEV_POP(qty) as stddev_qty
,STDDEV_POP(gmv) as stddev_gmv
,STDDEV_POP(store_profits) as stddev_store_profit
,STDDEV_POP(platform_profits) as stddev_platform_profits
,percentile_approx(qty, array(0.2,0.4,0.6,0.8), 9999) as qty_percentile
,percentile_approx(gmv, array(0.2,0.4,0.6,0.8), 9999) as gmv_percentile
,percentile_approx(store_profits, array(0.2,0.4,0.6,0.8), 9999) as store_profits
,percentile_approx(platform_profits, array(0.2,0.4,0.6,0.8), 9999) as platform_profits
FROM 
	(
	SELECT
		store_id
		,user_id
		,qty
		,gmv
		,store_profits
		,platform_profits
	FROM edw_tmp.tmp_tag_20210616
	WHERE group_type = '111001'
	) a
GROUP BY user_id 

#商品-门店聚集统计
SELECT
 store_id
,MIN(qty) as min_qty
,MAX(qty) as max_qty
,MIN(gmv) as min_gmv
,MAX(gmv) as max_gmv
,MIN(store_profits) as min_store_profits
,MAX(store_profits) as max_store_profits
,MIN(platform_profits) as min_platform_profits
,MAX(platform_profits) as max_platform_profits
,MIN(discount_amount) as min_discount_amount
,MAX(discount_amount) as max_discount_amount
,AVG(qty) as avg_qty
,AVG(gmv) as avg_gmv
,AVG(store_profits) as avg_store_profits
,AVG(platform_profits) as avg_platform_profits
,AVG(discount_amount) as avg_discount_amount
,STDDEV_POP(qty) as stddev_qty
,STDDEV_POP(gmv) as stddev_gmv
,STDDEV_POP(store_profits) as stddev_store_profit
,STDDEV_POP(platform_profits) as stddev_platform_profits
,STDDEV_POP(discount_amount) as stddev_discount_amount
,percentile_approx(qty, array(0.2,0.4,0.6,0.8), 9999) as qty_percentile
,percentile_approx(gmv, array(0.2,0.4,0.6,0.8), 9999) as gmv_percentile
,percentile_approx(store_profits, array(0.2,0.4,0.6,0.8), 9999) as store_profits_percentile
,percentile_approx(platform_profits, array(0.2,0.4,0.6,0.8), 9999) as platform_profits_percentile
,percentile_approx(discount_amount, array(0.2,0.4,0.6,0.8), 9999) as discount_amount_percentile
FROM edw_tmp.product_to_store_tag
GROUP BY store_id




SELECT
 store_id
,MIN(qty) as min_qty
,MAX(qty) as max_qty
,MIN(gmv) as min_gmv
,MAX(gmv) as max_gmv
,MIN(store_profits) as min_store_profits
,MAX(store_profits) as max_store_profits
,MIN(platform_profits) as min_platform_profits
,MAX(platform_profits) as max_platform_profits
,MIN(discount_amount) as min_discount_amount
,MAX(discount_amount) as max_discount_amount
,MIN(cut_profit_rate) as min_cut_profit_rate
,MAX(cut_profit_rate) as max_cut_profit_rate
,AVG(qty) as avg_qty
,AVG(gmv) as avg_gmv
,AVG(store_profits) as avg_store_profits
,AVG(platform_profits) as avg_platform_profits
,AVG(discount_amount) as avg_discount_amount
,AVG(cut_profit_rate) as avg_cut_profit_rate
,STDDEV_POP(qty) as stddev_qty
,STDDEV_POP(gmv) as stddev_gmv
,STDDEV_POP(store_profits) as stddev_store_profit
,STDDEV_POP(platform_profits) as stddev_platform_profits
,STDDEV_POP(discount_amount) as stddev_discount_amount
,STDDEV_POP(cut_profit_rate) as stddev_cut_profit_rate
,percentile_approx(qty, array(0.2,0.4,0.6,0.8), 9999) as qty_percentile
,percentile_approx(gmv, array(0.2,0.4,0.6,0.8), 9999) as gmv_percentile
,percentile_approx(store_profits, array(0.2,0.4,0.6,0.8), 9999) as store_profits_percentile
,percentile_approx(platform_profits, array(0.2,0.4,0.6,0.8), 9999) as platform_profits_percentile
,percentile_approx(discount_amount, array(0.2,0.4,0.6,0.8), 9999) as discount_amount_percentile
,percentile_approx(cut_profit_rate, array(0.2,0.4,0.6,0.8), 9999) as cut_profit_rate_percentile
FROM 
	(
	SELECT
		first_level_category
		,sku_sn
		,store_id
		,qty
		,order_total AS gmv
		,total_commission AS store_profits
		,total_ticket_amt AS discount_amount
		,total_platform_amt AS platform_profits
		,discount_amount/gmv
		FROM dw_detail.t_trade_order_area
		WHERE dt BETWEEN '20210501' AND '20210531'
		AND province = '湖南省'
	) a
GROUP BY store_id


SELECT
user_id
,store_id
,qty
,order_total AS gmv
,total_commission AS store_profits
,total_ticket_amt AS discount_amount
,total_platform_amt AS platform_profits
,(total_ticket_amt/order_total) AS cut_profit_rate
FROM dw_detail.t_trade_order_item_area
WHERE dt BETWEEN '20210501' AND '20210507'
AND province = '湖南省'


SELECT
vendor_id 
,store_id
,sku_sn 
,qty
,order_total AS gmv
,total_commission AS store_profits
,total_ticket_amt AS discount_amount
,total_platform_amt AS platform_profits
,(total_ticket_amt/order_total) AS cut_profit_rate
FROM dw_detail.t_trade_order_item_area
WHERE dt BETWEEN '20210508' AND '20210516'
AND province = '湖南省'

SELECT
user_id 
,sku_sn 
,qty
,order_total AS gmv
,total_commission AS store_profits
,total_ticket_amt AS discount_amount
,total_platform_amt AS platform_profits
,(total_ticket_amt/order_total) AS cut_profit_rate
FROM dw_detail.t_trade_order_item_area
WHERE dt BETWEEN '20210501' AND '20210507'
AND province = '湖南省'

SELECT
product_name
,total_ticket_amt
,(total_ticket_amt/order_total) AS cut_profit_rate
FROM dw_detail.t_trade_order_item_area
WHERE dt BETWEEN '20210501' AND '20210515'
AND sku_sn = '4576600'



#食堂采购顶格购买
SELECT * FROM 
(SELECT
product_name,
sku_sn,
store_id,
user_id,
user_name, 
order_date,
store_name, 
SUM(qty) as sum_qty,
COUNT(DISTINCT order_id) 
FROM dw_detail.t_trade_order_item_area
WHERE dt BETWEEN '20210501' AND '20210530'
AND province = '湖南省' AND store_name LIKE '%食堂%'
GROUP BY store_id,user_id,product_name,sku_sn, order_date,store_name,store_address,user_name 
) a

WHERE sum_qty = 99

SELECT * FROM 
(SELECT
first_level_category_name,
product_name,
spu_sn, 
order_date,
store_id,
user_id,
open_id,
SUM(qty) as sum_qty
FROM dw_detail.t_trade_order_item_area
WHERE dt ='20210501' AND store_name NOT LIKE '%食堂%'
AND province = '湖南省' 
GROUP BY open_id,user_id, store_id, first_level_category_name, product_name, spu_sn, store_name, order_date
)  a
INNER JOIN 
(SELECT user_limit_qty, spu_sn from 
ods_mysql_promotion.t_activity_preproduct 
) b
ON a.spu_sn = b.spu_sn
WHERE b.user_limit_qty <= a.sum_qty

#查询母婴用品
SELECT
user_id,
first_level_category_name,
product_name,
qty,
total_supply_price,
order_total,
order_date,
store_name
from dw_detail.t_trade_order_item_area
WHERE store_id = 66880000961898 AND dt BETWEEN '20210501' AND '20210530' 
AND total_supply_price >=100
ORDER BY order_date 

SELECT
first_level_category_name,
product_name, 
sum(qty) as sum_qty,
supply_price,
sum(order_total) as sum_order_total,
COUNT(DISTINCT user_id) as count_user,
store_name
from dw_detail.t_trade_order_item_area 
WHERE store_id = 66880000751904 AND dt = '20210701'
AND 
GROUP BY store_name,first_level_category_name,product_name,supply_price

INNER JOIN 
(SELECT user_limit_qty, spu_sn from 
ods_mysql_promotion.t_activity_preproduct)

  
SELECT
first_level_category_name,
product_name,  
user_id,
sum(qty) as sum_qty,
supply_price,
sum(order_total) as sum_order_total,
store_name
from dw_detail.t_trade_order_item_area 
WHERE dt = '20210701'
GROUP BY user_id ,first_level_category_name,product_name,store_name,supply_price

#活动前后可疑门店购买差异
#莲花兴盛优选平台
SELECT
product_name, 
user_id,
sum(qty) as sum_qty,
supply_price,
sum(order_total) as sum_order_total,
store_name
from dw_detail.t_trade_order_item_area 
WHERE dt = '20210706' AND store_name ='莲花兴盛优选平台'
GROUP BY user_id,product_name,store_name,supply_price





