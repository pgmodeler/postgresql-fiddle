-- http://www.postgresql.org/docs/9.2/static/view-pg-views.html

select * from pg_views;


SELECT v.oid, s.nspname as schema, v.relname as name, pg_get_viewdef(v.oid) as definition, d.description AS comment
FROM 
( 
	SELECT pg_class.oid, pg_class.* 
	FROM pg_class
	WHERE pg_class.relkind ='v'::"char"
) v
JOIN pg_namespace s ON s.oid = v.relnamespace
LEFT JOIN pg_description d ON d.objoid = v.oid AND d.classoid = 'pg_class'::regclass::oid AND d.objsubid = 0
ORDER by s.nspname, v.relname