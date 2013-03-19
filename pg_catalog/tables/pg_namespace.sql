-- http://www.postgresql.org/docs/9.2/static/catalog-pg-namespace.html
select * from pg_namespace;

SELECT s.oid,s.nspname AS name, d.description AS comment
FROM pg_namespace s
LEFT JOIN pg_description d ON d.objoid = s.oid AND d.classoid = 'pg_namespace'::regclass::oid
WHERE s.nspname !~ 'pg_toast'::text AND s.nspname !~ 'pg_temp_'::text
ORDER BY s.nspname;