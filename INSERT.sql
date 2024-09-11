/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/
INSERT INTO car_shop.discount (discount)
SELECT DISTINCT discount 
FROM raw_data.sales s

INSERT INTO car_shop.color (color)
SELECT DISTINCT SPLIT_PART(auto, ' ',-1)
FROM raw_data.sales s

INSERT INTO car_shop.brand (brand, brand_origin)
SELECT DISTINCT SPLIT_PART(auto, ' ',1), brand_origin 
FROM raw_data.sales s

INSERT INTO car_shop.client (fio, phone)
SELECT DISTINCT person_name, phone 
FROM raw_data.sales s

INSERT INTO car_shop.auto (model, gasoline_consumption, brand_id)
SELECT DISTINCT split_part(substr(auto,length(SPLIT_PART(auto, ' ',1))+2),',',1), s.gasoline_consumption, b.id
FROM raw_data.sales s
inner JOIN car_shop.brand b
ON SPLIT_PART(s.auto, ' ',1) = b.brand

INSERT INTO car_shop.sales (auto_id, color_id, client_id, discount_id, price, date)
SELECT DISTINCT a.id, c.id, cl.id, d.id, s.price, s.date
FROM raw_data.sales s
inner JOIN car_shop.auto a
	ON split_part(substr(s.auto,length(SPLIT_PART(s.auto, ' ',1))+2),',',1) = a.model
INNER JOIN car_shop.color c
	ON c.color = SPLIT_PART(s.auto, ' ',-1)
inner JOIN car_shop.client cl
	ON cl.fio =s.person_name
	AND cl.phone = s.phone 
inner JOIN car_shop.discount d
	ON s.discount = d.discount 
	
