-- http://www.postgresql.org/docs/9.2/static/catalog-pg-trigger.html

select * from pg_trigger;

SELECT t.oid,s.nspname as schema, c.relname as table, t.tgname AS name, t.tgenabled, t.tgdeferrable, t.tginitdeferred, pg_get_triggerdef(t.oid) AS definition
FROM pg_trigger t
JOIN pg_class c ON c.oid = t.tgrelid
JOIN pg_namespace s ON s.oid = c.relnamespace
WHERE t.tgisinternal = false
ORDER BY s.nspname, c.relname, t.tgname;