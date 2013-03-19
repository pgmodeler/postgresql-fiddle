-- http://www.postgresql.org/docs/9.2/static/catalog-pg-type.html

SELECT * FROM pg_type;

-- with values

SELECT t.oid,s.nspname AS schema, t.typname as name, t.typtype::character(1) AS typtype, t.typcategory, c.collname as collation, t.typcategory,
        CASE
            WHEN tbasetype.typname IS NOT NULL THEN sbasetype.nspname||'.'||tbasetype.typname
            ELSE NULL::text
        END AS basetype, t.typdefault AS "default", t.typnotnull, d.description AS comment
   FROM (SELECT oid,* FROM pg_type WHERE typrelid = 0::oid AND typcategory!='A') t
LEFT JOIN pg_namespace as s ON s.oid = t.typnamespace
LEFT JOIN pg_type tbasetype ON tbasetype.oid = t.typbasetype
LEFT JOIN pg_namespace sbasetype ON sbasetype.oid = tbasetype.typnamespace
LEFT JOIN pg_collation as c ON c.oid=t.typcollation
LEFT JOIN pg_description d ON d.objoid = t.oid AND d.classoid = 'pg_type'::regclass::oid
ORDER BY t.typnamespace, t.typname;

-- without values

SELECT t.oid,s.nspname AS schema, t.typname as name, t.typtype::character(1) AS typtype, t.typcategory, c.collname as collation, t.typcategory,
        CASE
            WHEN tbasetype.typname IS NOT NULL THEN sbasetype.nspname||'.'||tbasetype.typname
            ELSE NULL::text
        END AS basetype, t.typdefault AS "default", t.typnotnull AS is_not_null, d.description AS comment
   FROM (SELECT oid,* FROM pg_type WHERE typrelid = 0::oid AND typcategory!='A') t
LEFT JOIN pg_namespace as s ON s.oid = t.typnamespace
LEFT JOIN pg_type tbasetype ON tbasetype.oid = t.typbasetype
LEFT JOIN pg_namespace sbasetype ON sbasetype.oid = tbasetype.typnamespace
LEFT JOIN pg_collation as c ON c.oid=t.typcollation
LEFT JOIN pg_description d ON d.objoid = t.oid AND d.classoid = 'pg_type'::regclass::oid
ORDER BY t.typnamespace, t.typname;