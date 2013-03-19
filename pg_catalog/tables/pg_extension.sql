select * from pg_extension;

SELECT e.oid,e.extname AS name, s.nspname AS schema, e.extversion as version, d.description AS comment
FROM pg_extension e
JOIN pg_namespace s ON s.oid = e.extnamespace
LEFT JOIN pg_description d ON d.objoid = e.oid AND d.classoid = 'pg_extension'::regclass::oid
ORDER BY e.extname;