--
-- PostgreSQL database dump
--

\restrict xlotV1lHe7oEk1loggXX4lBerW21OkLL0AQNZboiBevxFzLIgys8Lptfi3vT2gs

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id integer NOT NULL,
    nama character varying(100) NOT NULL,
    deskripsi text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kategori_id_seq OWNER TO postgres;

--
-- Name: kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_id_seq OWNED BY public.kategori.id;


--
-- Name: obat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obat (
    id integer NOT NULL,
    nama character varying(100) NOT NULL,
    stok integer NOT NULL,
    expired_date date NOT NULL,
    kategori_id integer NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT obat_stok_check CHECK ((stok >= 0))
);


ALTER TABLE public.obat OWNER TO postgres;

--
-- Name: obat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.obat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.obat_id_seq OWNER TO postgres;

--
-- Name: obat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obat_id_seq OWNED BY public.obat.id;


--
-- Name: stok_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stok_log (
    id integer NOT NULL,
    keterangan text NOT NULL,
    stok_awal integer NOT NULL,
    stok_akhir integer NOT NULL,
    obat_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.stok_log OWNER TO postgres;

--
-- Name: stok_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stok_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stok_log_id_seq OWNER TO postgres;

--
-- Name: stok_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stok_log_id_seq OWNED BY public.stok_log.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password text NOT NULL,
    role character varying(20) NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: kategori id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN id SET DEFAULT nextval('public.kategori_id_seq'::regclass);


--
-- Name: obat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obat ALTER COLUMN id SET DEFAULT nextval('public.obat_id_seq'::regclass);


--
-- Name: stok_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log ALTER COLUMN id SET DEFAULT nextval('public.stok_log_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori (id, nama, deskripsi, deleted_at, created_at, updated_at) FROM stdin;
1	Analgesik	Pereda nyeri	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
2	Antipiretik	Penurun demam	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
3	Antibiotik	Obat infeksi bakteri	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
4	Antasida	Obat lambung	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
5	Antihipertensi	Penurun tekanan darah	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
6	test	123	\N	2025-12-29 07:46:05.00894	2025-12-29 07:46:05.00894
7	alamak	test	2025-12-29 07:50:49.119365	2025-12-29 07:46:08.504544	2025-12-29 07:46:08.504544
\.


--
-- Data for Name: obat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obat (id, nama, stok, expired_date, kategori_id, deleted_at, created_at, updated_at) FROM stdin;
1	Paracetamol	100	2026-01-01	1	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
2	Ibuprofen	80	2025-12-01	1	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
3	Amoxicillin	50	2025-10-01	3	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
4	Antasida DOEN	60	2026-03-01	4	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
5	Amlodipine	40	2026-06-01	5	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
\.


--
-- Data for Name: stok_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stok_log (id, keterangan, stok_awal, stok_akhir, obat_id, user_id, created_at) FROM stdin;
1	Stok awal	0	100	1	1	2025-12-27 23:37:03.149245
2	Stok awal	0	80	2	1	2025-12-27 23:37:03.149245
3	Stok awal	0	50	3	2	2025-12-27 23:37:03.149245
4	Stok awal	0	60	4	2	2025-12-27 23:37:03.149245
5	Stok awal	0	40	5	1	2025-12-27 23:37:03.149245
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role, deleted_at, created_at, updated_at) FROM stdin;
1	admin1	$2a$12$0uM1KciN/5Fi00r8Rv1UZeu9WD0dG9fsM/WCxoLLcj3A57i2kq2Mu	ADMIN	\N	2025-12-27 23:36:59.044628	2025-12-27 23:36:59.044628
2	admin2	$2a$12$0uM1KciN/5Fi00r8Rv1UZeu9WD0dG9fsM/WCxoLLcj3A57i2kq2Mu	ADMIN	\N	2025-12-27 23:36:59.044628	2025-12-27 23:36:59.044628
3	user1	$2a$12$0uM1KciN/5Fi00r8Rv1UZeu9WD0dG9fsM/WCxoLLcj3A57i2kq2Mu	USER	\N	2025-12-27 23:36:59.044628	2025-12-27 23:36:59.044628
\.


--
-- Name: kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_id_seq', 7, true);


--
-- Name: obat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.obat_id_seq', 5, true);


--
-- Name: stok_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stok_log_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id);


--
-- Name: obat obat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obat
    ADD CONSTRAINT obat_pkey PRIMARY KEY (id);


--
-- Name: stok_log stok_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log
    ADD CONSTRAINT stok_log_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: stok_log fk_log_obat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log
    ADD CONSTRAINT fk_log_obat FOREIGN KEY (obat_id) REFERENCES public.obat(id) ON DELETE RESTRICT;


--
-- Name: stok_log fk_log_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log
    ADD CONSTRAINT fk_log_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: obat fk_obat_kategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obat
    ADD CONSTRAINT fk_obat_kategori FOREIGN KEY (kategori_id) REFERENCES public.kategori(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict xlotV1lHe7oEk1loggXX4lBerW21OkLL0AQNZboiBevxFzLIgys8Lptfi3vT2gs

