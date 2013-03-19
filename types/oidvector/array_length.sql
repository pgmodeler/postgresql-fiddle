select array_length(proargtypes,1), oid,*
from pg_proc
where proisagg=false