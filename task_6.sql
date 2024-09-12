/*добавьте сюда запрос для решения задания 6*/
SELECT count(DISTINCT s.client_id) AS persons_from_usa_count
FROM car_shop.sales s 
INNER JOIN car_shop.client c 
	ON s.client_id =c.id 
WHERE LEFT(c.phone,2) = '+1' 
