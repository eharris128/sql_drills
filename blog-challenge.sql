--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

-- 
-- Name: post; Type: TABLE; Schema: public; Owner -
--

CREATE TABLE posts (
    id serial PRIMARY KEY,
    user_id integer REFERENCES users,
    title text,
    content text,
    date timestamp with time zone NOT NULL
);

-- 
-- Name: user; Type: TABLE; Schema: public; Owner -
--

CREATE TABLE users (
    id serial PRIMARY KEY,
    first_name text,
    last_name text,
    email text NOT NULL,
    screen_name text NOT NULL
);

--
-- Name: comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comments (
    id serial PRIMARY KEY,
    user_id integer REFERENCES users,
    post_id integer REFERENCES posts,
    comment text
);

--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tags (
    id serial PRIMARY KEY,
    tag text
);

--
-- Name: post__tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE post__tags (
    tag text,
    tag_id integer REFERENCES tags(id),
    post_id integer REFERENCES posts(id)
);






--
-- PostgreSQL database dump complete
--