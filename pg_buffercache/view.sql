--CREATE OR REPLACE VIEW _pg_buffercache.view AS 
CREATE extension IF NOT EXISTS pg_buffercache;
SELECT c.relname, count(*) AS count, pg_size_pretty(current_setting('block_size'::text)::integer * sum(
        CASE
            WHEN b.isdirty THEN 1
            ELSE 0
        END)) AS dirty, pg_size_pretty(current_setting('block_size'::text)::integer * count(*)) AS size, sum(b.usagecount) AS usagecount, sum(b.usagecount) / count(*) AS perpageusage
   FROM pg_buffercache b
   JOIN pg_class c ON b.relfilenode = c.relfilenode AND (b.reldatabase = ANY (ARRAY[0::oid, ( SELECT pg_database.oid
      FROM pg_database
     WHERE pg_database.datname = current_database())]))
  GROUP BY c.relname
  ORDER BY count(*) DESC
 LIMIT 100;
