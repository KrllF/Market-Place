set search_path = marketplace, public;



-- Получить суммарную стоимость товаров по категориям и 
-- отсортировать их в порядке убывания суммарной стоимости
select category_id, sum(price) as total_price
from goods
group by category_id
order by sum(price) desc;


-- Получить топ-3 товаров с самым высоким средним рейтингом 
-- и самым большим количеством отзывов в порядке убывания
select g.good_id, g.naming, avg(r.rating) as average_rating, count(r.review_id) as review_count
from goods g
join reviews r on g.good_id = r.good_id
group by g.good_id, g.naming
order by avg(r.rating) desc, count(r.review_id) desc
limit 3;


-- Для каждого пользователя получить идентификаторы его покупок, 
-- отсортированных по дате покупки в убывающем порядке, и 
-- добавить номера строк для каждой группы пользователей
select user_id, purchase_id, purchase_date,
       row_number() over(partition by user_id order by purchase_date desc) as row_num
from purchases;


-- для каждого пользователя определить, сколько всего покупок 
-- он совершил по сравнению с другими пользователями
select user_id, count(purchase_id) as purchase_count,
       rank() over(order by count(purchase_id) desc) as purchase_count_rank
from purchases
group by user_id;


-- определить для каждого товара количество отзывов, 
-- полученных в течение месяца с момента его появления на складе
with reviews_per_month as (
  select good_id, review_date,
         count(review_id) over(partition by good_id, date_trunc('month', review_date)) as reviews_count
  from reviews
)
select r.good_id, r.review_date, r.reviews_count
from reviews_per_month r
join goods g on r.good_id = g.good_id;
