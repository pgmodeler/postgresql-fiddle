CREATE TEMP TABLE tbl (
id serial primary key,
value text
);

INSERT INTO tbl (value)
VALUES ('value'), ('value2'), ('value3'), ('some_new');

SELECT * 
FROM tbl 
WHERE value NOT IN ARRAY['value'];
