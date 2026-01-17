--
-- PostgreSQL database dump
--

\restrict YAo3XLoldUKRzRiQeC8TTB2YJVHMrprBYznYViRbhhMd3Cz5g7nv56qaIL1RIV4

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-17 22:26:28

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

DROP DATABASE db_pbo_spo;
--
-- TOC entry 5067 (class 1262 OID 16860)
-- Name: db_pbo_spo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_pbo_spo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE db_pbo_spo OWNER TO postgres;

\unrestrict YAo3XLoldUKRzRiQeC8TTB2YJVHMrprBYznYViRbhhMd3Cz5g7nv56qaIL1RIV4
\connect db_pbo_spo
\restrict YAo3XLoldUKRzRiQeC8TTB2YJVHMrprBYznYViRbhhMd3Cz5g7nv56qaIL1RIV4

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16861)
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
-- TOC entry 220 (class 1259 OID 16870)
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
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 220
-- Name: kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_id_seq OWNED BY public.kategori.id;


--
-- TOC entry 221 (class 1259 OID 16871)
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
-- TOC entry 222 (class 1259 OID 16882)
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
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 222
-- Name: obat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obat_id_seq OWNED BY public.obat.id;


--
-- TOC entry 223 (class 1259 OID 16883)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    nama text NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16890)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 224
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 225 (class 1259 OID 16891)
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
-- TOC entry 226 (class 1259 OID 16903)
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
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 226
-- Name: stok_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stok_log_id_seq OWNED BY public.stok_log.id;


--
-- TOC entry 227 (class 1259 OID 16904)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password text NOT NULL,
    role_id integer CONSTRAINT users_role_not_null NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16915)
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
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4876 (class 2604 OID 16916)
-- Name: kategori id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN id SET DEFAULT nextval('public.kategori_id_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 16917)
-- Name: obat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obat ALTER COLUMN id SET DEFAULT nextval('public.obat_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16918)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 4883 (class 2604 OID 16919)
-- Name: stok_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log ALTER COLUMN id SET DEFAULT nextval('public.stok_log_id_seq'::regclass);


--
-- TOC entry 4885 (class 2604 OID 16920)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5052 (class 0 OID 16861)
-- Dependencies: 219
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori (id, nama, deskripsi, deleted_at, created_at, updated_at) FROM stdin;
1	Analgesik	Pereda nyeri	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
2	Antipiretik	Penurun demam	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
3	Antibiotik	Obat infeksi bakteri	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
4	Antasida	Obat lambung	\N	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
12	aaa	hayoaaa	2026-01-03 18:40:07.699112	2026-01-03 18:27:36.087394	2026-01-03 18:27:36.087394
5	Antihipertensi	Penurun tekanan darah	2026-01-13 21:20:34.0101	2025-12-27 23:37:00.369278	2025-12-27 23:37:00.369278
14	aosdjaoiwd	oaijdiowa	\N	2026-01-13 21:20:49.882898	2026-01-13 21:20:49.882898
15	asdawjd	oiajwoidaw	2026-01-13 21:20:57.926593	2026-01-13 21:20:53.09532	2026-01-13 21:20:53.09532
16	TEst	teadaw	\N	2026-01-13 21:33:26.186887	2026-01-13 21:33:26.186887
17	asdojawiod	iodawjdioaw	\N	2026-01-13 21:33:28.657275	2026-01-13 21:33:28.657275
18	test	123	\N	2026-01-13 21:33:32.064063	2026-01-13 21:33:32.064063
19	xx	bbxx	2026-01-15 19:59:04.632233	2026-01-15 19:58:56.765015	2026-01-15 19:58:56.765015
\.


--
-- TOC entry 5054 (class 0 OID 16871)
-- Dependencies: 221
-- Data for Name: obat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obat (id, nama, stok, expired_date, kategori_id, deleted_at, created_at, updated_at) FROM stdin;
2	Ibuprofen	80	2025-12-01	1	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
3	Amoxicillin	50	2025-10-01	1	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
6	aa	55	2026-01-15	1	2026-01-15 19:59:19.831027	2026-01-15 19:59:13.40545	2026-01-15 19:59:13.40545
1	Paracetamolss	57	2026-01-01	1	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
5	Amlodipine	41	2026-01-20	5	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
4	Antasida DOEN	60	2026-01-19	2	\N	2025-12-27 23:37:01.828772	2025-12-27 23:37:01.828772
7	A	114	2026-01-20	1	\N	2026-01-17 00:27:01.798689	2026-01-17 00:27:01.798689
8	Test	123	2026-01-30	1	\N	2026-01-17 22:07:58.146	2026-01-17 22:07:58.146
\.


--
-- TOC entry 5056 (class 0 OID 16883)
-- Dependencies: 223
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, nama) FROM stdin;
1	admin
2	user
\.


--
-- TOC entry 5058 (class 0 OID 16891)
-- Dependencies: 225
-- Data for Name: stok_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stok_log (id, keterangan, stok_awal, stok_akhir, obat_id, user_id, created_at) FROM stdin;
6	Tambah 1 stok	52	53	1	1	2026-01-05 01:04:20.049358
7	Kurangi 1 stok	53	52	1	1	2026-01-05 01:04:25.104395
8	Tambah 1 stok	40	41	5	1	2026-01-05 01:23:37.364205
9	Tambah 1 stok	41	42	5	1	2026-01-05 01:50:00.829751
10	Tambah 1 stok	60	61	4	1	2026-01-05 01:50:01.353669
11	Tambah 1 stok	50	51	3	1	2026-01-05 01:50:01.862065
12	Tambah 1 stok	80	81	2	1	2026-01-05 01:50:02.314212
13	Tambah 1 stok	52	53	1	1	2026-01-05 01:50:03.379572
14	Kurangi 1 stok	81	80	2	1	2026-01-05 01:50:03.888415
15	Kurangi 1 stok	51	50	3	1	2026-01-05 01:50:04.504056
16	Kurangi 1 stok	61	60	4	1	2026-01-05 01:50:05.205017
17	Kurangi 1 stok	42	41	5	1	2026-01-05 01:50:05.705471
18	Perubahan stok	11	55	6	1	2026-01-15 19:59:18.135784
19	Kurangi 1 stok	40	39	5	1	2026-01-15 20:04:10.685251
20	Tambah 1 stok	41	42	5	1	2026-01-15 20:04:11.385162
21	Tambah 1 stok	42	43	5	1	2026-01-15 20:04:12.003356
22	Tambah 1 stok	43	44	5	1	2026-01-15 20:04:12.767088
23	Tambah 1 stok	43	44	5	1	2026-01-15 20:04:13.070092
24	Tambah 1 stok	43	44	5	1	2026-01-15 20:04:13.249231
25	Tambah 1 stok	43	44	5	1	2026-01-15 20:04:13.398905
26	Kurangi 1 stok	45	44	5	1	2026-01-15 20:04:14.702821
27	Kurangi 1 stok	44	43	5	1	2026-01-15 20:04:15.204828
28	Kurangi 1 stok	43	42	5	1	2026-01-15 20:04:15.642142
29	Kurangi 1 stok	42	41	5	1	2026-01-15 20:04:16.079818
30	Kurangi 1 stok	41	40	5	1	2026-01-15 20:04:17.125217
31	Tambah 1 stok	54	55	1	1	2026-01-15 22:43:15.090637
32	Tambah 1 stok	55	56	1	1	2026-01-15 22:43:15.715342
33	Tambah 1 stok	56	57	1	1	2026-01-15 22:43:16.306094
34	Tambah 1 stok	57	58	1	1	2026-01-15 22:43:20.806846
35	Tambah 1 stok	112	113	7	1	2026-01-17 01:24:46.465555
36	Tambah 1 stok	113	114	7	1	2026-01-17 01:24:47.344796
37	Tambah 1 stok	114	115	7	1	2026-01-17 01:24:48.205702
\.


--
-- TOC entry 5060 (class 0 OID 16904)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role_id, deleted_at, created_at, updated_at) FROM stdin;
3	user	310dcbbf4cce62f762a2aaa148d556bd	2	\N	2025-12-27 23:36:59.044628	2025-12-27 23:36:59.044628
8	admin4	202cb962ac59075b964b07152d234b70	2	2026-01-15 21:57:33.134636	2026-01-05 00:11:54.09199	2026-01-05 00:11:54.09199
7	admin3	202cb962ac59075b964b07152d234b70	2	2026-01-15 21:57:34.803727	2026-01-05 00:07:28.720249	2026-01-05 00:07:28.720249
2	admin2	202cb962ac59075b964b07152d234b70	1	2026-01-15 21:57:36.220771	2025-12-27 23:36:59.044628	2025-12-27 23:36:59.044628
1	admin	202cb962ac59075b964b07152d234b70	1	\N	2025-12-27 23:36:59.044628	2025-12-27 23:36:59.044628
9	user2	bcbe3365e6ac95ea2c0343a2395834dd	2	\N	2026-01-15 21:57:51.876847	2026-01-15 21:57:51.876847
\.


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 220
-- Name: kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_id_seq', 19, true);


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 222
-- Name: obat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.obat_id_seq', 8, true);


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 224
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 226
-- Name: stok_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stok_log_id_seq', 37, true);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- TOC entry 4890 (class 2606 OID 16922)
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id);


--
-- TOC entry 4892 (class 2606 OID 16924)
-- Name: obat obat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obat
    ADD CONSTRAINT obat_pkey PRIMARY KEY (id);


--
-- TOC entry 4894 (class 2606 OID 16926)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 4896 (class 2606 OID 16928)
-- Name: stok_log stok_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log
    ADD CONSTRAINT stok_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 16930)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4900 (class 2606 OID 16932)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4902 (class 2606 OID 16933)
-- Name: stok_log fk_log_obat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log
    ADD CONSTRAINT fk_log_obat FOREIGN KEY (obat_id) REFERENCES public.obat(id) ON DELETE RESTRICT;


--
-- TOC entry 4903 (class 2606 OID 16938)
-- Name: stok_log fk_log_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok_log
    ADD CONSTRAINT fk_log_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- TOC entry 4901 (class 2606 OID 16943)
-- Name: obat fk_obat_kategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obat
    ADD CONSTRAINT fk_obat_kategori FOREIGN KEY (kategori_id) REFERENCES public.kategori(id) ON DELETE RESTRICT;


--
-- TOC entry 4904 (class 2606 OID 16948)
-- Name: users fk_user_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES public.role(id);


-- Completed on 2026-01-17 22:26:28

--
-- PostgreSQL database dump complete
--

\unrestrict YAo3XLoldUKRzRiQeC8TTB2YJVHMrprBYznYViRbhhMd3Cz5g7nv56qaIL1RIV4

