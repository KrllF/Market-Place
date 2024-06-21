create schema demo_db;
set search_path = demo_db, public;



drop table if exists categories cascade;
create table categories(
    category_id           int not null primary key,
    naming                text not null
);



drop table if exists supppliers cascade;
create table supppliers(
    supplier_id           int not null primary key,
    naming                text not null,
    rating                int check (rating between 0 and 10),
    registration_addres   text not null,
    contact_phone         text
);



drop table if exists goods cascade;
create table goods(
    good_id               int not null primary key,
    category_id           int not null references categories(category_id),
    supplier_id           int not null references supppliers(supplier_id),
    naming                text not null,
    rating                int not null check (rating between 1 and 10),
    price                 int check (price >= 0),
    description           text not null,
    quantity_in_stock     int check (quantity_in_stock >= 0)
);



drop table if exists suppply_description cascade;
create table suppply_description(
    suppply_id            int not null primary key,
    supplier_id           int not null references supppliers(supplier_id),
    supply_date           date
);




drop table if exists goods_in_supply cascade;
create table goods_in_supply(
    suppply_id            int not null,
    good_id               int not null,
    quantity              int check (quantity >= 0),
    primary key (suppply_id, good_id)
);


drop table if exists categories cascade;
create table categories(
    category_id           int not null primary key,
    naming                text not null
);



drop table if exists supppliers cascade;
create table supppliers(
    supplier_id           int not null primary key,
    naming                text not null,
    rating                int check (rating between 0 and 10),
    registration_addres   text not null,
    contact_phone         text
);

drop table if exists user_main cascade;
create table user_main(
    user_id               int not null primary key,
    verification          bool not null,
    first_name            text not null,
    surname               text not null,
    address               text,
    phone_number          text,
    email                 text
);


drop table if exists user_history cascade;
create table user_history(
    user_id               int not null primary key,
    verification          bool not null,
    first_name            text not null,
    surname               text not null,
    address               text,
    phone_number          text,
    email                 text,
    start_date            date,
    end_date              date
);



drop table if exists purchases cascade;
create table purchases(
     purchase_id           int not null unique primary key,
     user_id               int not null references user_main(user_id),
     purchase_date         date
);


drop table if exists item_in_purchases cascade;
create table item_in_purchases(
    purchase_id           int not null unique,
    product_id            int not null,
    quantity              int check (quantity >= 0),
    primary key (purchase_id, product_id)
);


drop table if exists reviews cascade;
create table reviews(
    review_id             int not null primary key,
    user_id               int not null references user_main(user_id),
    good_id               int not null references goods(good_id),
    rating                int not null check (rating between 0 and 10),
    review                text not null,
    review_date           date
);


