select pg_cancel_backend(pid) 
FROM pg_stat_activity
WHERE waiting=true;