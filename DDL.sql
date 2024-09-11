/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/
CREATE SCHEMA car_shop;

CREATE TABLE car_shop.discount (
	id SERIAL PRIMARY KEY,
	discount numeric NOT NULL
);
CREATE TABLE car_shop.color (
	id SERIAL PRIMARY KEY,
	color varchar(20) NOT NULL
);
CREATE TABLE car_shop.brand (
	id SERIAL PRIMARY KEY,
	brand varchar(50) NOT NULL,
	brand_origin varchar(24) NULL
);

CREATE TABLE car_shop.client (
	id SERIAL PRIMARY KEY,
	fio varchar(100) NOT NULL,
	phone varchar(24) NOT NULL
);

CREATE TABLE car_shop.auto (
	id SERIAL PRIMARY KEY,
	model varchar(50) NOT NULL,
	gasoline_consumption numeric NULL,
	brand_id int4 NOT NULL REFERENCES car_shop.brand (id)
);

CREATE TABLE car_shop.sales (
	id SERIAL PRIMARY KEY,
	auto_id int4 NOT NULL REFERENCES car_shop.auto (id),
	color_id int4 NOT NULL REFERENCES car_shop.color (id),
	client_id int4 NOT NULL REFERENCES car_shop.client (id),
	discount_id int4 NOT NULL REFERENCES car_shop.discount (id),
	price numeric NOT NULL,
	"date" date NOT NULL
);

