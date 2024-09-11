/*сохраните в этом файле запросы для первоначальной загрузки данных - создание схемы raw_data и таблицы sales и наполнение их данными из csv файла*/
\copy raw_date.sales(id,auto,gasoline_consumption,price,date,person_name,phone,discount,brand_origin) FROM C:\Temp\cars.csv CSV HEADER;
