-- http://www.postgresql.org/docs/9.2/static/catalog-pg-index.html

select * from pg_index;

SELECT c.oid, s.nspname as schema, t.relname AS table, c.relname as name, pg_get_indexdef(c.oid) AS definition, ts.spcname AS tablespace, d.description AS comment, c.*
FROM pg_index i
JOIN pg_class c ON c.oid = i.indexrelid AND c.relname !~ 'pg_toast_'::text
JOIN pg_class t ON t.oid = i.indrelid
JOIN pg_namespace s ON s.oid = t.relnamespace
LEFT JOIN pg_description d ON d.objoid = c.oid AND d.classoid = 'pg_index'::regclass::oid
LEFT JOIN pg_tablespace ts ON ts.oid = c.reltablespace
ORDER BY s.nspname, c.relname;