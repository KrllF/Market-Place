set search_path = marketplace, public;

-- CRUD запросы

-- INSERT
-- добавляем новые категорию и товар
insert into categories (category_id, naming) 
values (9, 'snack');

insert into goods (good_id, category_id, supplier_id, naming, rating, price, description, quantity_in_stock)
values (9, 5, 3, 'burn energy', 8, 1000, 'Burn is an energy drink owned and distributed by Monster Beverage Corporation, carrying the official tagline "Fuel your fire"', 12);


-- SELECT
-- выбираем все категории и товары с рейтингом > 3
select * from categories;

select * from goods where rating > 3;


-- UPDATE
-- обновим название категории с id = 1 и устанавливаем максимальную ценуна товар - 100
update categories set naming = 'game' where category_id = 1;

update goods set price = 100 where price > 100;

-- DELETE
-- удаляем 9ую категорию и 9го пользователя
delete from categories where category_id = 9;

delete from goods where good_id = 9;
