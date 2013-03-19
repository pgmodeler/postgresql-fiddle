SELECT EXTRACT(EPOCH FROM INTERVAL '5 days');
SELECT EXTRACT(EPOCH FROM INTERVAL '-5 days');

select date_part('epoch', '5 days'::interval);