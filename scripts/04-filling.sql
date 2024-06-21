set search_path = marketplace, public;

insert into categories
    (category_id, naming)
values  
	(1, 'board game'),
	(2, 'drug'),
	(3, 'tobacco'),
	(4, 'weapon'),
	(5, 'energy drink'),
	(6, 'sex toy'),
	(7, 'tights'),
	(8, 'underwear');


-- Creating users in user_main
insert into user_main 
	(user_id, verification, first_name, surname, address, phone_number, email) 
values
	(1, true, 'рустам', 'назаров', 'душанбе, ул. сомони 28', '+992987654321', 'rustam@example.com'),
	(2, false, 'махмад', 'амири', 'худжанд, ул. шахрисабз 12', '+992935712345', 'makhmad@example.com'),
	(3, true, 'нигина', 'хакимова', 'курган-тюбе, ул. ленина 15', '+992501234567', 'nigina@example.com'),
	(4, true, 'саида', 'мирзоева', 'хорог, ул. и. сомони 7', '+992987654321', 'saida@example.com'),
	(5, true, 'фаридун', 'хамзаев', 'истаравшан, ул. с. навои 3', '+992935712345', 'faridun@example.com'),
	(6, false, 'сафия', 'хайридинова', 'пенджикент, ул. р. передовой 22', '+992501234567', 'safiya@example.com'),
	(7, false, 'зухра', 'абдуллоева', 'исфара, ул. шерабад 10', '+992987654321', 'zuhra@example.com');


-- Creating user history
insert into user_history 
	(user_id, verification, first_name, surname, address, phone_number, email, start_date, end_date) 
values
	(1, true, 'рустам', 'назаров', 'душанбе, ул. сомони 28', '+992987654321', 'rustam@example.com', '2023-04-30 12:43:00', '2100-01-01 01:01:00'),
	(2, false, 'махмад', 'амири', 'худжанд, ул. шахрисабз 12', '+992935712345', 'makhmad@example.com', '2023-04-21 02:23:00', '2100-01-01 01:01:00'),
	(3, true, 'нигина', 'хакимова', 'курган-тюбе, ул. ленина 15', '+992501234567', 'nigina@example.com', '2023-05-20 13:50:00', '2100-01-01 01:01:00'),
	(4, true, 'саида', 'мирзоева', 'хорог, ул. и. сомони 7', '+992987654321', 'saida@example.com', '2023-02-15 23:59:00', '2100-01-01 01:01:00'),
	(5, true, 'фаридун', 'хамзаев', 'истаравшан, ул. с. навои 3', '+992935712345', 'faridun@example.com', '2023-12-21 12:59:00', '2100-01-01 01:01:00'),
	(6, false, 'сафия', 'хайридинова', 'пенджикент, ул. р. передовой 22', '+992501234567', 'safiya@example.com', '2023-10-20 22:13:00', '2100-01-01 01:01:00'),
	(7, false, 'зухра', 'абдуллоева', 'исфара, ул. шерабад 10', '+992987654321', 'zuhra@example.com', '2023-02-01 12:13:00', '2100-01-01 01:01:00');


-- Create suppliers
insert into suppliers 
	(supplier_id, naming, rating, registration_addres, contact_phone) 
values
	(1, 'дилдорбек', 8, 'г. ташкент, ул. олимпийская 7', '+9981122334455'),
	(2, 'абдуллок', 7, 'г. душанбе, ул. ленина 15', '+992987654321'),
	(3, 'саидмурод', 6, 'г. ашхабад, ул. нейтральности 3', '+993505050505'),
	(4, 'абасат', 9, 'г. алматы, ул. прозорливости 12', '+7777333773663'),
	(5, 'сасун', 8, 'г. бишкек, ул. веселости 22', '+996701010101'),
	(6, 'абдуллатиф', 7, 'г. ташкент, ул. привлекательности 10', '+998919191919'),
	(7, 'ага', 5, 'г. ашхабад, ул. мудрости 8', '+993606060606'),
	(8, 'дилноз', 7, 'г. душанбе, ул. прозорливости 5', '+992919191919');



-- Creating goods
insert into goods 
	(good_id, category_id, supplier_id, naming, rating, price, description, quantity_in_stock)
values
	(1, 1, 1, 'monopoly with secret compartments', 8, 20, 'a classic board game with an added twist!', 10),
	(2, 1, 2, 'candyland: the forbidden edition', 7, 15, 'a slightly darker take on the childhood game', 234),
	(3, 2, 3, 'unicorn horn infused with magic dust', 9, 100, 'guaranteed to bring sparkle and mystery to your life', 234),
	(4, 2, 4, 'mysterious elixir of mirth and mayhem', 8, 120, 'a potion that brings unpredictable results', 12),
	(5, 3, 5, 'smoking jacket of invisibility', 8, 80, 'keeps you warm and hidden on all occasions', 34),
	(6, 3, 6, 'stress-reducing cigarillos', 7, 10, 'for those relaxing moments of existential dread', 42),
	(7, 4, 7, 'silent but deadly serum', 9, 200, 'guaranteed to cause a giggle in any situation', 213),
	(8, 4, 8, 'nerf bazooka: the ultimate pillow fight weapon', 9, 150, 'for pillow fights that''ll leave your friends bewildered', 1413);


-- Creating some descripion (only date actually)
insert into supply_description 
	(supply_id, supplier_id, supply_date) 
values
	(1, 1, '2023-04-20'),
	(2, 2, '2023-04-21'),
	(3, 3, '2023-04-22'),
	(4, 4, '2023-04-23'),
	(5, 5, '2023-04-24'),
	(6, 6, '2023-04-25'),
	(7, 7, '2023-04-26'),
	(8, 8, '2023-04-27');

-- Creating information about goods (quantity)
insert into goods_in_supply 
	(supply_id, good_id, quantity) 
values
	(1, 1, 100),
	(2, 2, 150),
	(3, 3, 200),
	(4, 4, 120),
	(5, 5, 300),
	(6, 6, 80),
	(7, 7, 50),
	(8, 8, 90);




-- Creating purchases

insert into purchases 
	(purchase_id, user_id, purchase_date) 
values
	(1, 1, '2023-04-20'),
	(2, 2, '2023-04-21'),
	(3, 3, '2023-04-22'),
	(4, 4, '2023-04-23'),
	(5, 5, '2023-04-24'),
	(6, 6, '2023-04-25'),
	(7, 7, '2023-04-26'),
	(8, 4, '2023-04-27');

insert into item_in_purchases 
	(purchase_id, good_id, quantity) 
values
	(1, 1, 5),
	(2, 2, 3),
	(3, 3, 2),
	(4, 4, 1),
	(5, 1, 4),
	(6, 2, 2),
	(7, 3, 3),
	(8, 4, 1);



-- Creating reviews

insert into reviews 
	(review_id, user_id, good_id, rating, review, review_date) 
values
	(1, 1, 1, 8, 'жалган товар, сак ёндаш. как будто чапанхонадан келди!', '2023-04-20'),
	(2, 2, 2, 7, 'эй, достон, бу товар анвахта келмайди, ашу кон! базоркун!', '2023-04-21'),
	(3, 3, 3, 6, 'нима дей, дустлар, бу товар ёмон, чомил, чапанхонадан келганда...', '2023-04-22'),
	(4, 4, 4, 9, 'эх, дӯстон, ин калон товар, чапанхонадан ўнган қадар кучли! табрик!', '2023-04-23'),
	(5, 1, 1, 8, 'терак, дустон! ин бу товар ҳақиқатан чапандан келган, чапан ҳич тукумат!', '2023-04-24'),
	(6, 2, 2, 7, 'аға, бироқ, ин бу товар нукуссиз, чалпак булмайди, хариб, чапандан келган...', '2023-04-25'),
	(7, 3, 3, 6, 'эй, дустон, бу товардан чолишми, чапанхонадан келганда... таҷикистонга ҷон сохт', '2023-04-26'),
	(8, 4, 4, 9, 'ай-ай, дустон! ин бу товар геча чечнян ёдгоримида ўрганилган, қувватни созлаш!', '2023-04-27');