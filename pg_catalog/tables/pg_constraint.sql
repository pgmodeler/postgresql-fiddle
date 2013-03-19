-- http://www.postgresql.org/docs/9.2/static/catalog-pg-constraint.html

select * from pg_constraint;


-- domain constraints

SELECT c.oid,s.nspname as schema, pg_type.typname as domain, c.conname AS name, 
row_number() OVER (PARTITION BY pg_type.oid ORDER BY c.oid) as order,
pg_get_constraintdef(c.oid) AS definition, d.description AS comment
FROM (SELECT oid,* FROM pg_constraint WHERE contypid>0) as c
LEFT JOIN pg_type ON pg_type.oid = c.contypid
JOIN pg_namespace s ON s.oid = c.connamespace
LEFT JOIN pg_description d ON d.objoid = c.oid AND d.classoid = 'pg_constraint'::regclass::oid
ORDER BY s.nspname, pg_type.typname;

-- table constraints

SELECT c.oid,s.nspname as schema, pg_class.relname as table, c.conname AS name, 
row_number() OVER (PARTITION BY pg_class.oid ORDER BY c.oid) as order,
pg_get_constraintdef(c.oid) AS definition, d.description AS comment
FROM (SELECT oid,* FROM pg_constraint WHERE conrelid>0) as c
LEFT JOIN pg_class ON pg_class.oid = c.conrelid
JOIN pg_namespace s ON s.oid = c.connamespace
LEFT JOIN pg_description d ON d.objoid = c.oid AND d.classoid = 'pg_constraint'::regclass::oid
ORDER BY s.nspname, pg_class.relname;