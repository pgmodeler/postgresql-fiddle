SELECT a,
       CASE WHEN 1==1 THEN '1==1'
            WHEN 1==2 THEN '1==2'
            ELSE 'other'
       END
FROM test;