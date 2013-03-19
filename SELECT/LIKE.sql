CREATE TEMP TABLE tablename (
id serial primary key,
value text
);

INSERT INTO tablename (value)
VALUES ('value'), ('value2'), ('value3'), ('some_new');

SELECT * FROM tablename WHERE value NOT LIKE '%value%';
