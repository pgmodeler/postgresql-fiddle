DROP DOMAIN IF EXISTS domainname;
CREATE DOMAIN domainname as int NOT NULL default 88;

ALTER domain domainname RENAME TO domainname2;--POSTGRESQL 9.2+


DROP DOMAIN domainname;