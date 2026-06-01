create database ZomatoDB;
use ZomatoDB;

#--Table 1-Zomato_Restaurants
create table Zomato_Restaurants
(restaurant_id varchar(100) PRIMARY KEY,
restaurant_name varchar(100) NOT NULL,
city varchar(100) NULL,
area varchar(50) NULL,
cuisine varchar(100) NULL,
avg_rating decimal(3,2),
total_ratings int,
price_range varchar(100),
delivery_available varchar(100));

select * from Zomato_orders;

#--Table 2-Zomato_Orders
Create table Zomato_Orders
(order_id varchar(100) Primary key,
restaurant_id varchar(100),
customer_id varchar(100),
order_date date,
order_time time,
delivery_time int,
total_cost decimal(10,2),
item_count int,
payment_method varchar(50),
customer_rating decimal(2,1));

select * from Zomato_Orders;

CREATE TABLE Zomato_Restaurants_backup AS SELECT * FROM Zomato_Restaurants;
CREATE TABLE Zomato_Orders_backup AS SELECT * FROM Zomato_Orders;

#Cleaning validation
select count(distinct restaurant_id)
from Zomato_Restaurants
where restaurant_id not in (select restaurant_id
from Zomato_Orders);

select restaurant_id
from Zomato_Restaurants
group by restaurant_id
having count(restaurant_id)>1;


SELECT *
FROM Zomato_Restaurants
WHERE restaurant_id IS NULL;

SELECT *
FROM Zomato_Restaurants
WHERE restaurant_name IS NULL;

SELECT *
FROM Zomato_Restaurants
WHERE city IS NULL;

SELECT *
FROM Zomato_Restaurants
WHERE area IS NULL;

SELECT *
FROM Zomato_Restaurants
WHERE TRIM(restaurant_name)='';

SELECT *
FROM Zomato_Restaurants
WHERE TRIM(area)='';

SELECT *
FROM Zomato_Restaurants
WHERE TRIM(city)='';

SELECT *
FROM Zomato_Restaurants
WHERE TRIM(cuisine)='';

SELECT *
FROM Zomato_orders
WHERE TRIM(payment_method)='';

select order_id
from Zomato_orders
group by order_id
having count(order_id)>1;

select order_id
from zomato_orders
where total_Cost<=0;

SELECT *
FROM Zomato_orders
WHERE payment_method IS NULL;

SELECT *
FROM Zomato_orders
WHERE trim(payment_method)='';

select order_id
from zomato_orders
where item_count<=0;

SELECT *
FROM Zomato_Orders
WHERE customer_rating NOT BETWEEN 0 AND 5;

SELECT *
FROM Zomato_restaurants
WHERE avg_rating NOT BETWEEN 0 AND 5;

SELECT DISTINCT payment_method
FROM Zomato_Orders;

SELECT DISTINCT city
FROM Zomato_restaurants;

SELECT distinct order_id
from Zomato_Orders
where restaurant_id not in (select restaurant_id
from Zomato_restaurants);

Alter table Zomato_orders
add constraint fk_zomato_orders
foreign key (restaurant_id)
references zomato_restaurants(restaurant_id);