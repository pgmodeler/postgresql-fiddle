CREATE TEMP TABLE test (
id serial primary key,
"start" timestamp without time zone,
"end" timestamp without time zone,
CONSTRAINT CHECK rangeunique UNIQUE("start","end"),
CONSTRAINT CHECK rangecheck 
(select count(*)
from test
where VALUE between start and "end")=0
);
--INSERT INTO test(start,"end") VALUES(CURRENT_TIMESTAMP,CURRENT_TIMESTAMP+INTERVAL '1 day');
--INSERT INTO test(start,"end") VALUES(CURRENT_TIMESTAMP,CURRENT_TIMESTAMP+INTERVAL '1 day');