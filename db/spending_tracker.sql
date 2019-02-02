DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE users;


CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  category VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  transaction_date DATE NOT NULL DEFAULT CURRENT_DATE,
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
  amount_spent INT4
);

CREATE TABLE budgets (
  id SERIAL4 PRIMARY KEY,
  budget INT4
);
