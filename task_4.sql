/*добавьте сюда запрос для решения задания 4*/
SELECT c.fio AS person, string_agg(concat_ws(' ', b.brand, a.model),', ') AS cars
FROM car_shop.sales s 
INNER JOIN car_shop.client c 
	ON s.client_id = c.id 
INNER JOIN car_shop.auto a 
	ON s.auto_id = a.id 
INNER JOIN car_shop.brand b 
	ON a.brand_id = b.id 
GROUP BY c.fio
ORDER BY person
