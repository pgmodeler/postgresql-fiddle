CREATE TEMP TABLE IF NOT EXISTS "user" (
    name text primary key,
    packages integer
);
CREATE TEMP TABLE IF NOT EXISTS package (
    "user" text REFERENCES "user"(name),
    name text,
    CONSTRAINT pk primary key("user",name)
);
TRUNCATE  "user" CASCADE;
TRUNCATE  package;
INSERT INTO "user" VALUES ('user1'), ('user2');
INSERT INTO package  VALUES('user1','name1'), ('user1','name2'), ('user2','name3'), ('user2','name4');

UPDATE "user" SET packages=subquery.count
FROM  (
    SELECT "user", COUNT(*)
    FROM package
    GROUP BY "user"
) AS subquery
WHERE  "user".name=subquery."user";

select * from "user"