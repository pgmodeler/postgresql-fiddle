select * from pg_language;


SELECT pg_language.oid, pg_language.lanname AS name, lanispl, lanpltrusted,
    CASE
        WHEN pg_language.lanplcallfoid > 0::oid THEN pg_language.lanplcallfoid::regprocedure::name
        ELSE NULL::name
    END AS handler, 
    CASE
        WHEN pg_language.laninline > 0::oid THEN pg_language.laninline::regprocedure::name
        ELSE NULL::name
    END AS inline, 
    CASE
        WHEN pg_language.lanvalidator > 0::oid THEN pg_language.lanvalidator::regprocedure::name
        ELSE NULL::name
    END AS validator, d.description AS comment
FROM pg_language
LEFT JOIN pg_description d ON d.objoid = pg_language.oid AND d.classoid = 'pg_language'::regclass::oid
WHERE pg_language.lanname <> ALL (ARRAY['c'::name, 'internal'::name, 'plpgsql'::name])
ORDER BY pg_language.lanname;