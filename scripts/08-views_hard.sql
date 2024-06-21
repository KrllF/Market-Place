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


-- Сумма товаров в поставке и средний рейтинг в ней продавца(возможно полезно для подсчета рисков)

drop view if exists sum_goods_in_supply_and_avg_suppliers_rating_ordered cascade;
create or replace view sum_goods_in_supply_and_avg_suppliers_rating_ordered as
	select 	supply_description.supply_id,              
	    	supply_description.supply_date,
	    	sum(goods.price * goods_in_supply.quantity) as price_of_goods_sum,
	    	avg(suppliers.rating) as avg_supplier_rating
	from supply_description left join goods_in_supply 
		on supply_description.supply_id = goods_in_supply.supply_id
	left join goods on goods_in_supply.good_id = goods.good_id
	left join suppliers on supply_description.supplier_id = suppliers.supplier_id
	group by supply_description.supply_id
	order by sum(goods.price * goods_in_supply.quantity) desc;

-- Пользователь, сумма и количество купленных им товаров, а также его средние оценки для товаров(фамилия и имя объединены в один атрибут и маскированы)

drop view if exists user_goods_quantity_goods_sum_avg_rating cascade;
create or replace view user_goods_quantity_goods_sum_avg_rating as
	select 	simple_mask(user_main.first_name, 1, 0) || ' ' ||  simple_mask(user_main.surname, 1, 0) as full_name,              
	    	sum(item_in_purchases.quantity) as goods_quantity,
	    	sum(goods.price * item_in_purchases.quantity) as price_of_goods_sum,
	    	avg(reviews.rating) as avg_user_reviews_rating
	from user_main left join purchases 
		on user_main.user_id = purchases.user_id
	left join item_in_purchases on purchases.purchase_id = item_in_purchases.purchase_id
	left join goods on item_in_purchases.good_id = goods.good_id
	full join reviews on user_main.user_id = reviews.user_id
	group by user_main.user_id
	order by sum(goods.price * item_in_purchases.quantity) desc;

-- Товар, суммарная стоимость его продаж, средний балл среди комментариев проверенных пользователей, упорядочены по сумме

drop view if exists good_sum_price_avg_verified_rating_ordred cascade;
create or replace view good_sum_price_avg_verified_rating_ordred as
	select 	goods.naming  as naming,     
			sum(goods.price * item_in_purchases.quantity) as sum_price,
	    	avg(u_m.reviews_rating) as avg_rating
	from goods left join item_in_purchases 
		on goods.good_id = item_in_purchases.good_id
	full join (select reviews.rating as reviews_rating, reviews.good_id as reviews_good_id  
	from reviews left join user_main 
	on reviews.user_id = user_main.user_id where user_main.verification) u_m 
	on goods.good_id = u_m.reviews_good_id
	group by goods.good_id
	order by sum(goods.price * item_in_purchases.quantity) desc;



