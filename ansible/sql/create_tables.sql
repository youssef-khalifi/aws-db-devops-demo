-- create_tables.sql
CREATE TABLE IF NOT EXISTS test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO test_table (name) VALUES ('Hello World');

UPDATE test_table SET name = 'Hello Ansible' WHERE name = 'Hello World';
