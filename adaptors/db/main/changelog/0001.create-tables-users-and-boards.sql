--liquibase formatted sql

--changeset feynubrick:1 dbms:postgresql
CREATE TABLE users (
      id SERIAL PRIMARY KEY,
      hash_id text UNIQUE,
      oauth_id text,
      oauth_platform varchar(10),
      refresh_token text,
      cookie text UNIQUE,
      created_at timestamp WITH TIME ZONE DEFAULT now(),
      last_login_at timestamp WITH TIME ZONE DEFAULT NULL,
      unique (oauth_id, oauth_platform)
);
--rollback DROP TABLE users;

--changeset feynubrick:2 dbms:postgresql
CREATE TABLE boards (
      id SERIAL PRIMARY KEY,
      hash_id text,
      content text NOT NULL,
      writer_id integer REFERENCES users(id) ON DELETE CASCADE,
      created_at timestamp WITH TIME ZONE DEFAULT now(),
      edited_at timestamp WITH TIME ZONE DEFAULT NULL,
      num_read integer DEFAULT 0,
      unique (id, hash_id)
);
--rollback DROP TABLE boards;