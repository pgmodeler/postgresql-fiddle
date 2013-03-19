-- http://www.postgresql.org/docs/9.2/static/catalog-pg-tablespace.html

select * from pg_tablespace;

SELECT ts.oid,ts.spcname AS name, ts.spclocation AS location, ts.spcoptions as options, d.description AS comment
FROM pg_tablespace ts
LEFT JOIN pg_description d ON d.objoid = ts.oid AND d.classoid = 'pg_tablespace'::regclass::oid AND d.objsubid = 0;
