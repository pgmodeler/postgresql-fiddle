-- http://www.postgresql.org/docs/9.2/static/catalog-pg-proc.html

select * from pg_proc;

 SELECT p.oid, s.nspname AS schema, p.proname, ARRAY( SELECT format_type(t.oid, NULL::integer) AS format_type
           FROM pg_type t
      JOIN ( SELECT unnest(p.proallargtypes) AS oid) arg ON arg.oid = t.oid) AS allargtypes, p.proargmodes::character(1)[] AS argmodes, p.proargnames AS argnames, regexp_split_to_array(pg_get_expr(p.proargdefaults, 'pg_proc'::regclass::oid), ','::text) AS _default, l.lanname AS lang, p.provolatile AS volatility, pg_get_functiondef(p.oid) AS definition, p.prorettype::regtype::text AS return, d.description AS comment
FROM pg_proc p
JOIN pg_language l ON l.oid = p.prolang
JOIN pg_namespace s ON s.oid = p.pronamespace
LEFT JOIN pg_description d ON d.objoid = p.oid AND d.classoid = 'pg_proc'::regclass::oid
WHERE p.proisagg = false
ORDER BY s.nspname, p.proname;