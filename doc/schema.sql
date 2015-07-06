-- Beer order database

CREATE TABLE beer (
	id serial not null,
	name varchar(50) not null,
	description varchar (250) not null,
	style varchar(30) not null,
	bottle_size varchar(20) not null,
	label bytea,
	price decimal not null,
	maximum_order_amount integer,
	available_quantity integer not null default 0,
	creation_date timestamp not null default now(),
	CONSTRAINT beer_pk PRIMARY KEY (id)
);
CREATE TABLE request (
	id serial not null,
	customer_name varchar(50) not null,
	email_address varchar(100),
	phone_number varchar(20),
	delivery_address varchar(200) not null,
	quantity integer not null,
	status varchar(10),
	order_date timestamp not null default now(),
	beer_id integer not null,
	CONSTRAINT order_pk PRIMARY KEY (id),
	CONSTRAINT order_beer_fk FOREIGN KEY (beer_id) REFERENCES beer (id)
);



