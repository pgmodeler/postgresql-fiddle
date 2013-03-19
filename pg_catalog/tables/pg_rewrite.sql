-- http://www.postgresql.org/docs/9.2/static/catalog-pg-rewrite.html

select * from pg_rewrite;

-- table rule

SELECT r.oid, s.nspname as schema, c.relname as table, r.rulename AS name, r.ev_enabled, r.is_instead, 
CASE r.ev_type
    WHEN '1'::"char" THEN 'SELECT'::text
    WHEN '2'::"char" THEN 'UPDATE'::text
    WHEN '3'::"char" THEN 'INSERT'::text
    WHEN '4'::"char" THEN 'DELETE'::text
    ELSE NULL::text
END AS event, pg_get_ruledef(r.oid) AS definition, d.description AS comment
FROM (
	SELECT pg_rewrite.oid, pg_rewrite.*
	FROM pg_rewrite
	WHERE pg_rewrite.ev_type <> '1'::"char"--EXCEPT TABLE SELECT
) r
JOIN pg_class c ON c.oid = r.ev_class AND c.relkind='r' -- TABLE
JOIN pg_namespace s ON s.oid = c.relnamespace
LEFT JOIN pg_description d ON d.objoid = r.oid AND d.classoid = 'pg_rules'::regclass::oid
ORDER BY s.nspname, c.relname, r.rulename;

-- view rule

SELECT r.oid, s.nspname as schema, c.relname as table, r.rulename AS name, r.ev_enabled, r.is_instead, 
CASE r.ev_type
    WHEN '1'::"char" THEN 'SELECT'::text
    WHEN '2'::"char" THEN 'UPDATE'::text
    WHEN '3'::"char" THEN 'INSERT'::text
    WHEN '4'::"char" THEN 'DELETE'::text
    ELSE NULL::text
END AS event, pg_get_ruledef(r.oid) AS definition, d.description AS comment
FROM (
	SELECT pg_rewrite.oid, pg_rewrite.*
	FROM pg_rewrite
	WHERE pg_rewrite.ev_type <> '1'::"char"--EXCEPT TABLE SELECT
) r
JOIN pg_class c ON c.oid = r.ev_class AND c.relkind='v' -- VIEW
JOIN pg_namespace s ON s.oid = c.relnamespace
LEFT JOIN pg_description d ON d.objoid = r.oid AND d.classoid = 'pg_rules'::regclass::oid
ORDER BY s.nspname, c.relname, r.rulename;