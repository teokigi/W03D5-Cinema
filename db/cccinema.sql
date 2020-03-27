DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;



CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    funds INT
);

CREATE TABLE films(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    price INT
);

CREATE TABLE tickets(
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    film_id INT REFERENCES films(id)
);

INSERT INTO customers (name,funds) VALUES   ('Bob Marley', 100),
                                            ('Boris Johnson', 99),
                                            ('Bon Jovi', 98),
                                            ('Jordan Peterson', 97),
                                            ('Mike Graham', 96),
                                            ('Markus Meechan',95),
                                            ('Angela Murkel', 94),
                                            ('Emma Watson', 93),
                                            ('Ryan Reynolds', 92),
                                            ('Nichola Sturgeon', 91),
                                            ('Rei Ayanami', 90);

INSERT INTO films (title,price) VALUES      ('Iron Man',10),
                                            ('Pokemon', 11),
                                            ('Sword Art Online',12),
                                            ('Berzerk',13),
                                            ('Elfen Lied',14),
                                            ('Ghost In The Shell',15);
