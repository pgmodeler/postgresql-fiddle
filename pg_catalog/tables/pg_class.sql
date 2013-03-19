-- http://www.postgresql.org/docs/9.2/static/catalog-pg-class.html

SELECT * FROM pg_class;

SELECT c.oid,s.nspname AS schema, c.relname as name, 
(pg_sequence_parameters(c.oid)).increment AS increment, 
(pg_sequence_parameters(c.oid)).minimum_value AS minvalue, 
(pg_sequence_parameters(c.oid)).maximum_value AS maxvalue, 
(pg_sequence_parameters(c.oid)).start_value AS start, 
(pg_sequence_parameters(c.oid)).cycle_option AS is_cycle, 
d.description AS comment
FROM 
(
	SELECT pg_class.oid, pg_class.relnamespace, pg_class.relname
	FROM pg_class
	WHERE pg_class.relkind = 'S'::"char"
) c
JOIN pg_namespace s ON s.oid = c.relnamespace
LEFT JOIN pg_description d ON d.objoid = c.oid AND d.classoid = 'pg_class'::regclass::oid
ORDER BY s.nspname, c.relname;