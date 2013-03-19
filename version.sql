#!/usr/bin/psql

select version();

select (regexp_matches(version(),'.\..'))[1]::real;

select substring(version(),E'.\\..')::real;