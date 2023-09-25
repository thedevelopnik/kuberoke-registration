SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: kuberoke; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA kuberoke;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: attendees; Type: TABLE; Schema: kuberoke; Owner: -
--

CREATE TABLE kuberoke.attendees (
    id uuid NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    ticket_code text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attendees_events; Type: TABLE; Schema: kuberoke; Owner: -
--

CREATE TABLE kuberoke.attendees_events (
    attendee_id uuid NOT NULL,
    event_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: events; Type: TABLE; Schema: kuberoke; Owner: -
--

CREATE TABLE kuberoke.events (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: kuberoke; Owner: -
--

CREATE SEQUENCE kuberoke.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: kuberoke; Owner: -
--

ALTER SEQUENCE kuberoke.events_id_seq OWNED BY kuberoke.events.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(128) NOT NULL
);


--
-- Name: events id; Type: DEFAULT; Schema: kuberoke; Owner: -
--

ALTER TABLE ONLY kuberoke.events ALTER COLUMN id SET DEFAULT nextval('kuberoke.events_id_seq'::regclass);


--
-- Name: attendees attendees_email_key; Type: CONSTRAINT; Schema: kuberoke; Owner: -
--

ALTER TABLE ONLY kuberoke.attendees
    ADD CONSTRAINT attendees_email_key UNIQUE (email);


--
-- Name: attendees_events attendees_events_pkey; Type: CONSTRAINT; Schema: kuberoke; Owner: -
--

ALTER TABLE ONLY kuberoke.attendees_events
    ADD CONSTRAINT attendees_events_pkey PRIMARY KEY (attendee_id, event_id);


--
-- Name: attendees attendees_pkey; Type: CONSTRAINT; Schema: kuberoke; Owner: -
--

ALTER TABLE ONLY kuberoke.attendees
    ADD CONSTRAINT attendees_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: kuberoke; Owner: -
--

ALTER TABLE ONLY kuberoke.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--


--
-- Dbmate schema migrations
--

INSERT INTO public.schema_migrations (version) VALUES
    ('20230925200000'),
    ('20230925205951'),
    ('20230925210125'),
    ('20230925210426');
