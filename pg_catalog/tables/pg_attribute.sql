-- http://www.postgresql.org/docs/9.2/static/catalog-pg-attribute.html

select * from pg_attribute;

 -- TABLE columns

 SELECT s.nspname as schema, 
 c.relname as table, 
 a.attname AS name, 
 a.atttypid::regtype::name AS regtype, 
 a.order, 
 a.attnotnull, 
 def.adsrc AS "default", 
 a.attislocal, 
 pg_collation.collname as collation, 
 d.description AS comment
   FROM ( 
	SELECT pg_attribute.*, row_number() OVER (PARTITION BY pg_attribute.attrelid ORDER BY pg_attribute.attnum) AS order
	FROM pg_attribute
	WHERE pg_attribute.attnum > 0 AND pg_attribute.attisdropped = false
) a
JOIN pg_class c ON c.oid = a.attrelid AND c.relkind = 'r'::"char" AND c.relpersistence <> 't'::"char"
JOIN pg_namespace s ON s.oid = c.relnamespace
LEFT JOIN pg_attrdef def ON def.adrelid = a.attrelid AND def.adnum = a.attnum
LEFT JOIN pg_collation ON pg_collation.oid=a.attcollation
LEFT JOIN pg_description d ON d.objoid = a.attrelid AND d.classoid = 'pg_class'::regclass::oid AND d.objsubid = a.attnum
ORDER BY s.nspname, c.relname, a.attnum;

 -- VIEW columns

SELECT s.nspname as schema, c.relname as view, 
a.attname AS name, 
a.atttypid::regtype::name AS regtype, 
a.order, 
def.adsrc AS "default", 
a.attislocal, 
pg_collation.
collname as collation, 
d.description AS comment
   FROM ( 
	SELECT pg_attribute.*, row_number() OVER (PARTITION BY pg_attribute.attrelid ORDER BY pg_attribute.attnum) AS order
	FROM pg_attribute
	WHERE pg_attribute.attnum > 0 AND pg_attribute.attisdropped = false
) a
JOIN pg_class c ON c.oid = a.attrelid AND c.relkind = 'v'::"char" AND c.relpersistence <> 't'::"char"
JOIN pg_namespace s ON s.oid = c.relnamespace
LEFT JOIN pg_attrdef def ON def.adrelid = a.attrelid AND def.adnum = a.attnum
LEFT JOIN pg_collation ON pg_collation.oid=a.attcollation
LEFT JOIN pg_description d ON d.objoid = a.attrelid AND d.classoid = 'pg_class'::regclass::oid AND d.objsubid = a.attnum
ORDER BY s.nspname, c.relname, a.attnum;