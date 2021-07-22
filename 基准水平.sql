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
