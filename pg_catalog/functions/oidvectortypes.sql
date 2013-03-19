select oid::regprocedure, oidvectortypes(proargtypes), * 
from pg_proc