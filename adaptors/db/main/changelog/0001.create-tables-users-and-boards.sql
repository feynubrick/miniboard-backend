--liquibase formatted sql

--changeset feynubrick:1 dbms:postgresql
CREATE TABLE users (
      id SERIAL PRIMARY KEY,
      hash_id text UNIQUE NOT NULL,
      oauth_id text,
      oauth_platform varchar(10),
      refresh_token text,
      cookie text UNIQUE NOT NULL,
      created_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
      last_login_at timestamp WITH TIME ZONE DEFAULT NULL,
      unique (oauth_id, oauth_platform)
);
--rollback DROP TABLE users;

--changeset feynubrick:2 dbms:postgresql
CREATE TABLE boards (
      id SERIAL PRIMARY KEY,
      hash_id text NOT NULL,
      content text NOT NULL,
      writer_id integer REFERENCES users(id) ON DELETE CASCADE NOT NULL,
      created_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
      edited_at timestamp WITH TIME ZONE DEFAULT NULL,
      num_read integer DEFAULT 0 NOT NULL,
      unique (writer_id, hash_id)
);
--rollback DROP TABLE boards;