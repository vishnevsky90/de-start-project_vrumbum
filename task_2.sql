/*добавьте сюда запрос для решения задания 2*/
SELECT b.brand AS brand_name, extract(YEAR from s.date) AS year, round(avg(s.price),2) AS price_avg
FROM car_shop.sales s
INNER JOIN car_shop.auto a 
	ON s.auto_id =a.id 
INNER JOIN car_shop.brand b 
	ON a.brand_id =b.id 
GROUP BY b.brand, extract(YEAR from s.date)
ORDER BY b.brand, year
