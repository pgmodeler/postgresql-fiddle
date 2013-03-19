CREATE TEMP TABLE "user" (
    name text primary key
);
CREATE TEMP TABLE package (
    "user" text REFERENCES "user"(name),
    name text,
    CONSTRAINT pk primary key("user",name)
);
INSERT INTO "user" VALUES ('user1'), ('user2');

INSERT INTO package  VALUES('user1','name1'), ('user1','name2'), ('user2','name3'), ('user2','name4');
