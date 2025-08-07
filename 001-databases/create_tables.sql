CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    product TEXT NOT NULL,
    price REAL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO users (name, email) VALUES ('Anna Kowalska', 'anna@example.com');
INSERT INTO users (name, email) VALUES ('Jan Nowak', 'jan@example.com');

INSERT INTO orders (user_id, product, price) VALUES (1, 'Laptop', 3999.99);
INSERT INTO orders (user_id, product, price) VALUES (2, 'Telefon', 1999.50);

