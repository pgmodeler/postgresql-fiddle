SELECT TIMESTAMP '2011-03-11 10:40:13' < NOW();
--http://stackoverflow.com/questions/5271038/how-to-determine-if-one-timestamp-precedes-another-in-postgresql

select '2011-03-01'::timestamp < '2011-03-02'::timestamp;