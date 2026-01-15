--
-- PostgreSQL database dump
--

\restrict 75S4M5F5ZCruVl7WAAyofmltnbxi7Sh0gOLMDHVbwhIjqFcrdsmYUZenmd0DNff

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-15 22:14:43

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
-- TOC entry 220 (class 1259 OID 16459)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    nama_lengkap character varying(100)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16458)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 227 (class 1259 OID 18296)
-- Name: kegiatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kegiatan (
    id integer NOT NULL,
    judul character varying(100),
    deskripsi text,
    tanggal date,
    gambar character varying(255)
);


ALTER TABLE public.kegiatan OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18295)
-- Name: kegiatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kegiatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kegiatan_id_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 226
-- Name: kegiatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kegiatan_id_seq OWNED BY public.kegiatan.id;


--
-- TOC entry 221 (class 1259 OID 16470)
-- Name: mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mahasiswa (
    nim character varying(20) NOT NULL,
    nama character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    angkatan character varying(4)
);


ALTER TABLE public.mahasiswa OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16497)
-- Name: pengeluaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengeluaran (
    id integer NOT NULL,
    tanggal date DEFAULT CURRENT_DATE NOT NULL,
    jumlah numeric(12,2) NOT NULL,
    keperluan text NOT NULL
);


ALTER TABLE public.pengeluaran OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16496)
-- Name: pengeluaran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengeluaran_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pengeluaran_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 224
-- Name: pengeluaran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengeluaran_id_seq OWNED BY public.pengeluaran.id;


--
-- TOC entry 223 (class 1259 OID 16479)
-- Name: setoran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setoran (
    id integer NOT NULL,
    nim character varying(20),
    tanggal date DEFAULT CURRENT_DATE NOT NULL,
    jumlah numeric(12,2) NOT NULL,
    keterangan text
);


ALTER TABLE public.setoran OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16478)
-- Name: setoran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setoran_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.setoran_id_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 222
-- Name: setoran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setoran_id_seq OWNED BY public.setoran.id;


--
-- TOC entry 4828 (class 2604 OID 16462)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 18299)
-- Name: kegiatan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatan ALTER COLUMN id SET DEFAULT nextval('public.kegiatan_id_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 16500)
-- Name: pengeluaran id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengeluaran ALTER COLUMN id SET DEFAULT nextval('public.pengeluaran_id_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 16482)
-- Name: setoran id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setoran ALTER COLUMN id SET DEFAULT nextval('public.setoran_id_seq'::regclass);


--
-- TOC entry 4995 (class 0 OID 16459)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, username, password, nama_lengkap) FROM stdin;
1	admin	admin123	Bendahara 1
\.


--
-- TOC entry 5002 (class 0 OID 18296)
-- Dependencies: 227
-- Data for Name: kegiatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kegiatan (id, judul, deskripsi, tanggal, gambar) FROM stdin;
12	Hari Guru	Merayakan hari guru	2025-11-25	antarafoto-perayaan-hari-guru-nasional-di-semarang-1732521521.webp
13	Buka Puasa Bersama	Buka puasa bersama satu kelas	2026-02-19	download (1).jpeg
\.


--
-- TOC entry 4996 (class 0 OID 16470)
-- Dependencies: 221
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mahasiswa (nim, nama, password, angkatan) FROM stdin;
0110224005	Ahmad Yudistira  	12345678	2024
0110224065	Latif Wibowo	12345678	2024
0110224114	Aby Sofyan Hanafi	12345678	2024
0110224042	Noval Maulani	12345678	2024
\.


--
-- TOC entry 5000 (class 0 OID 16497)
-- Dependencies: 225
-- Data for Name: pengeluaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengeluaran (id, tanggal, jumlah, keperluan) FROM stdin;
14	2026-01-13	20000.00	membeli spidol dan penghapus kelas
\.


--
-- TOC entry 4998 (class 0 OID 16479)
-- Dependencies: 223
-- Data for Name: setoran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.setoran (id, nim, tanggal, jumlah, keterangan) FROM stdin;
32	0110224005	2026-01-12	20000.00	lunas
33	0110224065	2026-01-10	20000.00	lunasin
34	0110224114	2026-01-08	15000.00	nyicil
35	0110224042	2026-01-10	5000.00	bayar 1 minggu 
\.


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 226
-- Name: kegiatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kegiatan_id_seq', 13, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 224
-- Name: pengeluaran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengeluaran_id_seq', 14, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 222
-- Name: setoran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setoran_id_seq', 35, true);


--
-- TOC entry 4835 (class 2606 OID 16467)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 4837 (class 2606 OID 16469)
-- Name: admin admin_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_username_key UNIQUE (username);


--
-- TOC entry 4845 (class 2606 OID 18304)
-- Name: kegiatan kegiatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatan
    ADD CONSTRAINT kegiatan_pkey PRIMARY KEY (id);


--
-- TOC entry 4839 (class 2606 OID 16477)
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (nim);


--
-- TOC entry 4843 (class 2606 OID 16509)
-- Name: pengeluaran pengeluaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengeluaran
    ADD CONSTRAINT pengeluaran_pkey PRIMARY KEY (id);


--
-- TOC entry 4841 (class 2606 OID 16490)
-- Name: setoran setoran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setoran
    ADD CONSTRAINT setoran_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 16491)
-- Name: setoran setoran_nim_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setoran
    ADD CONSTRAINT setoran_nim_fkey FOREIGN KEY (nim) REFERENCES public.mahasiswa(nim);


-- Completed on 2026-01-15 22:14:43

--
-- PostgreSQL database dump complete
--

\unrestrict 75S4M5F5ZCruVl7WAAyofmltnbxi7Sh0gOLMDHVbwhIjqFcrdsmYUZenmd0DNff

