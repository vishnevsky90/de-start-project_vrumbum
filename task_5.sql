/*добавьте сюда запрос для решения задания 5*/
SELECT b.brand_origin, max(s.price*100/(100 - d.discount)) AS price_max, min(s.price*100/(100 - d.discount)) AS price_min
FROM car_shop.sales s 
INNER JOIN car_shop.auto a 
	ON s.auto_id = a.id 
INNER JOIN car_shop.brand b 
	ON a.brand_id =b.id
INNER JOIN car_shop.discount d 
	ON s.discount_id =d.id 
WHERE b.brand_origin IS NOT NULL 
GROUP BY b.brand_origin
