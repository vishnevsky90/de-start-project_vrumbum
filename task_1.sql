/*добавьте сюда запрос для решения задания 1*/
WITH a AS (SELECT sum(CASE WHEN gasoline_consumption IS NULL THEN 1 ELSE 0	END) AS no_gasoline_consumption ,count(*) AS total
FROM car_shop.auto)

SELECT cast(no_gasoline_consumption AS decimal)/cast(total AS decimal)*100 AS nulls_percentage_gasoline_consumption
FROM a
