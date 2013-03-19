-- http://www.postgresql.org/docs/9.2/static/catalog-pg-collation.html

select * from pg_collation;

SELECT c.oid,c.collname AS name, s.nspname AS schema, c.collcollate as collate, c.collctype as ctype, d.description AS comment
FROM pg_collation c
JOIN pg_namespace s ON s.oid = c.collnamespace
LEFT JOIN pg_description d ON d.objoid = c.oid AND d.classoid = 'pg_collation'::regclass::oid
ORDER BY c.collname;