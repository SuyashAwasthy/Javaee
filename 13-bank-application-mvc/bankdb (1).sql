create database bankdb;
use bankdb;

create table bankdb.admin (
	email varchar(50) primary key,
    password varchar(50) not null
);


create table bankdb.customers (
    id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null
);

create table bankdb.accounts (
	account_number int auto_increment primary key,
    customer_id int not null,
    balance double default 0,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

create table bankdb.transactions (
    id int auto_increment primary key,
    sender_account_number int not null,
    receiver_account_number int not null,
    type varchar(10) not null,
    amount double not null,
    date timestamp default current_timestamp
);

select * from bankdb.admin;
insert into admin (email, password) values ('admin@bank', 'admin123');






