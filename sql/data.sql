--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_id_seq OWNER TO postgres;

--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country_id integer NOT NULL,
    money_balance double precision DEFAULT 0 NOT NULL,
    CONSTRAINT team_money_balance_check CHECK ((money_balance >= (0)::double precision))
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: player id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
1	France
2	Germany
3	Spain
4	Italy
5	England
6	Portugal
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id, name, surname, team_id) FROM stdin;
2	Jane	Smith	1
3	Michael	Johnson	1
4	Emma	Brown	1
5	Daniel	Martinez	1
6	Sophia	Garcia	1
7	Marco	Rossi	1
8	Chiara	Bianchi	1
9	David	Jones	1
10	Olivia	Taylor	1
11	Alex	Williams	2
12	Sophie	Miller	2
13	Benjamin	Davis	2
14	Isabella	Wilson	2
15	Mason	Moore	2
16	Emily	Taylor	2
17	Ethan	Anderson	2
18	Amelia	Thomas	2
19	Jacob	Jackson	2
20	Ava	White	2
21	Noah	Martinez	3
22	Emma	Anderson	3
23	Liam	Harris	3
24	Olivia	Clark	3
25	William	Lewis	3
26	Sophia	Walker	3
27	James	Green	3
28	Charlotte	King	3
29	Oliver	Hall	3
30	Amelia	Young	3
31	Elijah	Brown	4
32	Chloe	Evans	4
33	Lucas	Thompson	4
34	Avery	Hall	4
35	Alexander	Garcia	4
36	Mia	Martinez	4
37	Mason	Lee	4
38	Harper	Walker	4
39	Carter	Hernandez	4
40	Evelyn	Diaz	4
41	Michael	Lopez	5
42	Ella	Perez	5
43	Matthew	Moore	5
44	Avery	Gonzalez	5
45	Sofia	Martin	5
46	Jackson	Hernandez	5
47	Charlotte	Nelson	5
48	Daniel	Wright	5
49	Scarlett	Roberts	5
50	Aiden	Lee	5
51	William	Perez	6
52	Aubrey	Sanchez	6
53	Daniel	Gonzalez	6
54	Avery	Young	6
55	Sophia	Harris	6
56	Logan	Lewis	6
57	Ella	Roberts	6
58	Matthew	Lopez	6
59	Avery	Campbell	6
60	Madison	Nelson	6
1	John	Doe	1
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, name, country_id, money_balance) FROM stdin;
2	Team B	2	1500
3	Team C	3	2000
5	Team E	5	1800
6	Team F	6	900
4	Team D	4	1200
1	Team A	1	1000
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 6, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_seq', 61, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 8, true);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: player player_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id);


--
-- Name: team team_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- PostgreSQL database dump complete
--

