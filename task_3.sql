/*добавьте сюда запрос для решения задания 3*/
SELECT extract(MONTH from s.date) AS month, extract(YEAR from s.date) AS year, round(avg(s.price),2) AS price_avg
FROM car_shop.sales s
WHERE extract(YEAR from s.date) = 2022
GROUP BY extract(MONTH from s.date), extract(YEAR from s.date)
ORDER BY MONTH
