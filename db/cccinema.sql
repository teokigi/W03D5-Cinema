    --drop if existing tables
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;
    --create Customers table.
CREATE TABLE customers
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    funds INT
);
    --create a films table.
CREATE TABLE films
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    price INT
);
--create a screenings table.
CREATE TABLE screenings
(
id SERIAL PRIMARY KEY,
film_id INT REFERENCES films(id) ON DELETE CASCADE,
showtime VARCHAR(255),
availability INT NOT NULL,
sales INT DEFAULT 0
);
    --create a tickets table.
CREATE TABLE tickets
(
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    film_id INT REFERENCES films(id) ON DELETE CASCADE
);
