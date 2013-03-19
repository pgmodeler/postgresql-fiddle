-- http://www.postgresql.org/docs/9.2/static/catalog-pg-enum.html

select * from pg_enum;

SELECT pg_enum.oid,pg_namespace.nspname as schema,pg_type.typname as type,pg_enum.enumlabel as label,pg_enum.enumsortorder as order
FROM pg_enum
JOIN pg_type ON pg_type.oid=pg_enum.enumtypid
JOIN pg_namespace ON pg_namespace.oid=pg_type.typnamespace;