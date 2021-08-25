--1.Report

SELECT (orders.received_at)
	,addresses.country
	,sum(order_items.quantity) AS SUM_Quantity
	,count(order_items.order_id) AS Orders
	,CASE 
		WHEN order_items.price_per_item = 0
			THEN 'Free'
		ELSE 'not free'
		END AS Free_quantity
FROM [dbo].[orders]
JOIN order_items ON orders.id = order_items.order_id
JOIN addresses ON orders.delivery_address_id = addresses.id
WHERE orders.invoice_address_id <> orders.delivery_address_id
	AND order_items.STATE NOT LIKE '%CANCELLED%'
	AND order_items.deleted NOT LIKE '%true%'
GROUP BY orders.received_at
	,orders.delivery_address_id
	,orders.invoice_address_id
	,addresses.country
	,CASE 
		WHEN order_items.price_per_item = 0
			THEN 'Free'
		ELSE 'not free'
		END;
--2.Report

SELECT orders.received_at
	,goods.free_attributes AS GOODS_GROUPS
	,SUM(order_items.quantity) AS quantity
FROM order_items
INNER JOIN orders ON orders.id = order_items.order_id
INNER JOIN goods ON goods.id = order_items.goods_id
WHERE goods_id IN (
		3110
		,4159
		,4504
		,4505
		)
	AND order_items.STATE IN (
		'FINISHED'
		,'CONFIRMED'
		)
	AND (
		orders.received_at BETWEEN '2020-01-01'
			AND '2020-01-15'
		)
	AND (goods.free_attributes LIKE '%GOODS%')
	AND (order_items.deleted LIKE '%false%')
GROUP BY orders.received_at
	,goods.free_attributes
ORDER BY orders.received_at ASC;



--3.Report

SELECT received_at
	,order_id
	,round(rate * shipping_cost, 2) AS shipping_cost_czk
	,round(rate * price_per_item, 2) AS order_value_czk
	,goods_id
	,name
	,sum(quantity) AS quantity
FROM order_items
INNER JOIN orders ON order_items.order_id = orders.id
INNER JOIN currency_rates ON orders.currency_id = currency_rates.currency_id
INNER JOIN goods ON order_items.goods_id = goods.id
WHERE (STATE LIKE 'FINISHED')
	AND (deleted = 0)
GROUP BY order_id
ORDER BY order_id
	,goods_id ASC;
