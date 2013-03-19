select oid, CAST(proargtypes as int[]), * 
from pg_proc