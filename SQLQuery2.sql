
SELECT * FROM sales.orders ord

SELECT* FROM sales.customers cus

SELECT * from sales.order_items item

SELECT* FROM production.products pro

SELECT * FROM production.categories

SELECT * FROM production.brands bra

SELECT * FROM sales.stores

SELECT * FROM sales.staffs



--Adding tables together

SELECT DISTINCT ord.order_id, 
	CONCAT(cus.first_name, ' ' ,cus.last_name) AS 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(item.quantity) AS 'total__units',
	SUM(item.quantity*item.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep',
	bra.brand_name
FROM sales.orders ord --giving the table's name a shortcut name.
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items item
ON ord.order_id= item.order_id
JOIN production.products pro
ON item.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
JOIN production.brands bra
ON pro.brand_id = bra.brand_id

GROUP BY	
	ord.order_id,
	CONCAT(cus.first_name, ' ' ,cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name),
	bra.brand_name



	