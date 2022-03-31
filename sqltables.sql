Show server_version

DROP TABLE salesdataset

CREATE TABLE salesdataset( 
	row_id INT NOT null,
	order_id INT NOT null,
	city VARCHAR not null,
	birth_year int not null,
	client_name VARCHAR not null,
	client_segment VARCHAR not null,
	discount float,
	order_date date not null,
	order_priority VARCHAR not null,
	order_quantity INT not null,
	product_margin float,
	product_category VARCHAR not null,
	product_container VARCHAR not null,
	product_name VARCHAR not null,
	product_subcategory VARCHAR not null,
	profit float NOT null,
	region VARCHAR not null,
	sales float,
	ship_date date not null,
	ship_mode VARCHAR not null,
	ship_cost float NOT null,
	state VARCHAR not null,
	unit_price float NOT null,
	zip_code INT not null
-- 	PRIMARY KEY (order_id)
);

select * from salesdataset limit 10

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'salesdataset'
"row_id"
"order_id"
"city"
"birth_year"
"client_name"
"client_segment"
"discount"
"order_date"
"order_priority"
"order_quantity"
"product_margin"
"product_category"
"product_container"
"product_name"
"product_subcategory"
"profit"
"region"
"sales"
"ship_date"
"ship_mode"
"ship_cost"
"state"
"unit_price"
"zip_code"

SELECT * FROM salesdataset limit 10;

select max(discount) from salesdataset

-- 
-- split and creat tables
SELECT cl.birth_year, 
       cl.client_name, 
       cl.client_segment
			 discount
INTO dim_clients
FROM salesdataset AS cl
ORDER BY client_name;

SELECT region, 
       product_container, 
       product_name,
			 product_subcategory
INTO dim_product
FROM salesdataset
ORDER BY product_category;

SELECT region, 
       state, 
       zip_code
INTO dim_store
FROM salesdataset
ORDER BY zip_code;

-- table as Date
id
date
month
year

-- create new table as select
  DROP TABLE IF EXISTS fact_table;
    CREATE TEMP TABLE fact_table AS
     SELECT 
       i.id as info_id, i.information as information
     FROM
      clients
			products
			location_shop

      INNER JOIN graph g ON i.id = g.id;


--  Installing uuid-osp
--  First check if you have the extension already installed by running  
 SELECT * FROM pg_extension

--  in terminal? make
-- make instal
-- in pgA 
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- If you want to generate a UUID value solely based on random numbers, you can use the uuid_generate_v4() 
-- https://www.postgresqltutorial.com/postgresql-uuid/

SELECT uuid_generate_v4();

-- alter tables to add uuid

ALTER TABLE products 
ADD COLUMN id_product uuid DEFAULT uuid_generate_v4 ();

-- alter tables to add the keys


