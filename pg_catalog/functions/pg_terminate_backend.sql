-- http://dba.stackexchange.com/questions/6122/how-do-i-detach-all-other-users-from-a-postgres-database

SELECT pg_terminate_backend( procpid )
FROM pg_stat_activity
WHERE procpid <> pg_backend_pid( ) -- 1. don't terminate your own session
AND datname =                      -- 2. don't terminate connections to other databases in the cluster 
(SELECT datname FROM pg_stat_activity WHERE procpid = pg_backend_pid() );



-- http://stackoverflow.com/questions/5408156/how-to-drop-a-postgresql-database-if-there-are-active-connections-to-it

--select pg_terminate_backend(procpid)
--from pg_stat_activity
--where datname = 'doomed_database';