set search_path = marketplace, public;

-- Обычное маскирование

drop function if exists simple_mask cascade;
create or replace function simple_mask(str text, x integer, y integer) RETURNS text AS $$
    select substring(str from 1 for x) || 'xxxxxx' || substring(str from length(str) - y for y);
$$ LANGUAGE SQL;

-- Маскирование электронной почты

drop function if exists mask_email cascade;
create or replace function mask_email(email text) RETURNS text AS $$
    select substring(email from 1 for 2) || 'xxxxxx' || substring(email from
   		strpos(email, '@') for length(email) - strpos(email, '@') + 1);
$$ LANGUAGE SQL;


-- Товары в наличии на складе

drop view if exists non_zero_quantity_product_ordered cascade;
create or replace  view non_zero_quantity_product_ordered as
	select 	goods.naming,              
	    	goods.rating,                
	   	 	goods.price,                
	    	goods.description,           
	    	goods.quantity_in_stock
	from goods where goods.quantity_in_stock > 0
	order by goods.quantity_in_stock desc;

-- Верифицированные пользователи, данные маскированы

drop view if exists verified_users cascade;
create or replace  view verified_users as
	select 	
			simple_mask(user_main.first_name, 1, 0) as first_name,    
			simple_mask(user_main.surname, 1, 0) as surname,    
	   	 	simple_mask(user_main.address, 3, 0) as address,    
	   	 	simple_mask(user_main.phone_number, 2, 2) as phone_number,                
	    	mask_email(user_main.email) as email
		from user_main where user_main.verification;

-- Хорошие поставщики(те, у которых рейтинг больше 7), данные не маскируются, так как считаем,
-- что информация о поставщике публичная, тут же поставщики упорядочены по рейтингу

drop view if exists good_suppliers_ordered cascade;
create or replace view good_supplies_ordered as
	select 	suppliers.naming,              
	    	suppliers.rating,                
	    	suppliers.registration_addres,           
	    	suppliers.contact_phone
		from suppliers where suppliers.rating > 7
	order by suppliers.rating desc;
	
-- Длинные отзывы
	
drop view if exists long_review cascade;
create or replace view long_review as
	select 	reviews.rating,              
	    	reviews.review,                
	    	reviews.review_date        
		from reviews where length(reviews.review) > 50;

-- Сумма количества товаров по поставкам, упорядочены по сумме
	
drop view if exists sum_goods_in_supply_ordered cascade;
create or replace view summ_goods_in_supply_ordered as
	select 	supply_description.supply_id,              
	    	supply_description.supply_date,
	    	sum(goods_in_supply.quantity) as quantity_of_goods_in_supply
	from supply_description left join goods_in_supply 
		on supply_description.supply_id = goods_in_supply.supply_id
	group by supply_description.supply_id
	order by sum(goods_in_supply.quantity) desc;

