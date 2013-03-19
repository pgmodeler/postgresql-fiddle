-- http://stackoverflow.com/questions/2951875/postgresql-how-do-i-set-the-search-path-at-the-user-level

ALTER USER username SET search_path = schema1,schema2,schema3,etc;