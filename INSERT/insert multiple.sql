CREATE TEMP TABLE t
(
    datetime TIMESTAMP,
    value integer
    
);
INSERT INTO t(datetime,value) VALUES 
(CURRENT_TIMESTAMP,0),
(CURRENT_TIMESTAMP,0);
