CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR,
    age INTEGER,
    VIP BOOLEAN
);


CREATE TABLE sale(
    sale_id SERIAL PRIMARY KEY,
    customer_id SERIAL
);

ALTER TABLE sale 
ADD FOREIGN KEY (customer_id) REFERENCES customer (customer_id);

ALTER TABLE sale 
ADD amount NUMERIC(8,2);

ALTER TABLE sale 
ADD sale_date TIMESTAMP;

ALTER TABLE sale ALTER COLUMN customer_id TYPE INT;

ALTER TABLE concession ALTER COLUMN sale_id TYPE INT;

ALTER TABLE movie ALTER COLUMN ticket_id TYPE INT;

ALTER TABLE ticket ALTER COLUMN sale_id TYPE INT;


CREATE TABLE concession(
    concession SERIAL PRIMARY KEY,
    sale_id SERIAL,
    price NUMERIC(8,2),
    concession_name VARCHAR,
    concession_desc VARCHAR,
    FOREIGN KEY (sale_id) REFERENCES sale (sale_id)
);


CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    sale_id SERIAL,
    price NUMERIC(8,2),
    ticket_name VARCHAR,
    ticket_class VARCHAR,
    ticket_sale_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (sale_id) REFERENCES sale (sale_id)
);


CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    ticket_id SERIAL,
    movie_title VARCHAR,
    movie_genre VARCHAR,
    movie_duration TIME, 
    FOREIGN KEY (ticket_id) REFERENCES ticket (ticket_id)
);