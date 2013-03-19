-- http://www.postgresql.org/docs/9.2/static/view-pg-tables.html

select * from pg_tables;

--tables

SELECT t.oid, s.nspname AS schema, t.relname as name, i.inhparent::regclass::name AS parent,
t.relhasoids, CASE WHEN t.relpersistence='pu' THEN true ELSE false END as is_nologged, ts.spcname AS tablespace
FROM 
( 
	SELECT pg_class.oid, pg_class.* 
	FROM pg_class
	WHERE pg_class.relkind ='r'::"char" AND pg_class.relpersistence <> 't'::"char"
) t
JOIN pg_namespace s ON s.oid = t.relnamespace
LEFT JOIN pg_description d ON d.objoid = t.oid AND d.classoid = 'pg_class'::regclass::oid AND d.objsubid = 0
LEFT JOIN pg_inherits i ON i.inhrelid = t.oid
LEFT JOIN pg_tablespace ts ON ts.oid = t.reltablespace
ORDER BY s.nspname, t.relname;