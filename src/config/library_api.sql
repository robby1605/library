--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2025-06-16 11:54:08

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
-- TOC entry 214 (class 1259 OID 16444)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    published_year integer NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    isbn character varying(13) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16469)
-- Name: borrowings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrowings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    book_id uuid,
    member_id uuid,
    borrow_date date NOT NULL,
    return_date date,
    status character varying(10) DEFAULT 'BORROWED'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.borrowings OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16457)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(15) NOT NULL,
    address text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 3345 (class 0 OID 16444)
-- Dependencies: 214
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, author, published_year, stock, isbn, created_at, updated_at) FROM stdin;
6d404d52-86d4-4473-9a61-d20fe2a181f2	To Kill a Mockingbird	Harper Lee	1960	3	9780446310789	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
9ca65e6d-992e-46db-b454-04f6b68b01e5	1984	George Orwell	1949	4	9780451524935	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
028b5182-bbed-41a4-bab5-83d3a071141e	Pride and Prejudice	Jane Austen	1813	6	9780141439518	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
ac471b78-2feb-42b2-8f9f-c0251067e7e6	The Catcher in the Rye	J.D. Salinger	1951	3	9780316769488	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
6a596b18-4031-4e7c-a12e-e42b6cbd9fca	The Hobbit	J.R.R. Tolkien	1937	7	9780547928227	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
154558a1-6918-4b06-8dcb-393785c3e16c	The Da Vinci Code	Dan Brown	2003	4	9780307474278	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
507a528b-bb46-4800-9a0f-70aa1d1c79f4	The Alchemist	Paulo Coelho	1988	5	9780062315007	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
0b118bef-0161-497b-94c8-8f57f02d6599	The Little Prince	Antoine de Saint-Exupéry	1943	8	9780156012195	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
0b76dcbc-6f69-4fd1-94af-14c0365cd12c	Brave New World	Aldous Huxley	1932	4	9780060850524	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
e91f64ad-c640-4a12-b7e4-c49eb5dfe676	The Lord of the Rings	J.R.R. Tolkien	1954	6	9780618640157	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
c9140dd3-b6d5-4d03-8093-2f6e1144379c	Harry Potter and\nthe Sorcerer's Stone	J.K. Rowling	1997	7	9780590353427	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
df45fb64-39b2-454e-8591-c05cd2b93138	The Chronicles of\nNarnia	C.S. Lewis	1950	5	9780066238501	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
9434a281-a63d-484d-9de4-fa852e8b1ea4	One Hundred Years of Solitude	Gabriel García Márquez	1967	3	9780060883287	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
1e412d8c-539b-4a3f-a44d-6cec932009a2	The Hunger Games	Suzanne\nCollins	2008	6	9780439023481	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
f039007c-206b-4a72-94ae-b1d6b6f01f0b	The Road	Cormac McCarthy	2006	4	9780307387899	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
72b089eb-3e0f-4900-8e0f-04c42a42d092	The Kite Runner	Khaled Hosseini	2003	5	9781594631931	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
51360d16-7e40-4aea-9990-fcde77b9940f	The Book Thief	Markus Zusak	2005	6	9780375842207	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
bb4e269e-1ed3-40cf-9b3a-35226cfb1564	Life of Pi	Yann Martel	2001	4	9780156027328	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
164ac3dd-5e76-4324-ba00-21ea6ab6e8af	The Great Gatsby	F. Scott Fitzgerald	1925	1	9780743273565	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
b2592c38-bdc5-417b-aeae-f32e75186f3a	The Girl with the Dragon Tattoo	Stieg Larsson	2005	4	9780307949486	2025-06-16 02:16:01.587383	2025-06-16 02:16:01.587383
\.


--
-- TOC entry 3347 (class 0 OID 16469)
-- Dependencies: 216
-- Data for Name: borrowings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borrowings (id, book_id, member_id, borrow_date, return_date, status, created_at, updated_at) FROM stdin;
78a18eca-e7b8-4953-8dbb-cf237b120033	164ac3dd-5e76-4324-ba00-21ea6ab6e8af	54e0dc26-ed7a-41a3-833d-eb3c922d5417	2025-06-16	\N	BORROWED	2025-06-16 07:30:57.630625	2025-06-16 07:30:57.630625
30db409c-c2bf-41d5-9241-18e402c27734	164ac3dd-5e76-4324-ba00-21ea6ab6e8af	6c83d746-377b-43fe-854d-5088d7e3b91e	2025-06-16	\N	BORROWED	2025-06-16 07:49:24.598032	2025-06-16 07:49:24.598032
9784744d-1854-4232-8e19-2539b5c8bd0d	164ac3dd-5e76-4324-ba00-21ea6ab6e8af	4116aac8-86c6-4ee0-8b0b-1be6f870720d	2025-06-16	\N	BORROWED	2025-06-16 07:50:16.39503	2025-06-16 07:50:16.39503
3b66746b-62d8-41d5-b2bb-3ede302fa51a	164ac3dd-5e76-4324-ba00-21ea6ab6e8af	5640aed1-f1aa-4c3b-96fd-262ebce870b6	2025-06-16	\N	BORROWED	2025-06-16 07:50:51.411411	2025-06-16 07:50:51.411411
c9009212-94b4-4fc6-82b2-6991a37730e8	bb4e269e-1ed3-40cf-9b3a-35226cfb1564	5640aed1-f1aa-4c3b-96fd-262ebce870b6	2025-06-16	\N	BORROWED	2025-06-16 07:54:54.640617	2025-06-16 07:54:54.640617
e8a87256-0ccf-4a19-a3e1-f1caa4d6cb24	164ac3dd-5e76-4324-ba00-21ea6ab6e8af	5640aed1-f1aa-4c3b-96fd-262ebce870b6	2025-06-16	2025-06-16	RETURNED	2025-06-16 07:50:53.825332	2025-06-16 07:50:53.825332
b92cd192-0fe7-4665-b609-14444ca038df	b2592c38-bdc5-417b-aeae-f32e75186f3a	6c83d746-377b-43fe-854d-5088d7e3b91e	2025-06-16	2025-06-16	RETURNED	2025-06-16 09:14:19.018517	2025-06-16 09:14:19.018517
\.


--
-- TOC entry 3346 (class 0 OID 16457)
-- Dependencies: 215
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, name, email, phone, address, created_at, updated_at) FROM stdin;
54e0dc26-ed7a-41a3-833d-eb3c922d5417	John Doe	john.doe@email.com	081234567890	123 Main St, City	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
6c83d746-377b-43fe-854d-5088d7e3b91e	Jane\nSmith	jane.smith@email.com	081234567891	456 Oak Ave, Town	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
4116aac8-86c6-4ee0-8b0b-1be6f870720d	Robert\nJohnson	robert.j@email.com	081234567892	789 Pine Rd, Village	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
45de241e-1c49-4c89-8b26-e9cf918fe318	Mary\nWilliams	mary.w@email.com	081234567893	321 Elm St, Borough	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
bc2c85d0-8e27-4f0a-897a-5946f8a179a4	Michael\nBrown	michael.b@email.com	081234567894	654 Maple Dr, District	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
5640aed1-f1aa-4c3b-96fd-262ebce870b6	Sarah\nDavis	sarah.d@email.com	081234567895	987 Cedar Ln, County	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
d966f021-87b2-4a49-9817-4e4a0e2e269c	James\nWilson	james.w@email.com	081234567896	147 Birch Ave, State	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
d6cf5fcf-1fe5-4df4-8783-03f9ec117f70	Emily\nTaylor	emily.t@email.com	081234567897	258 Spruce St, Province	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
4bc457d7-b052-46eb-8953-5de2bd704079	David\nAnderson	david.a@email.com	081234567898	369 Ash Rd, Territory	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
4ba53397-3419-4981-859a-3a140a84866b	Lisa\nThomas	lisa.t@email.com	081234567899	741 Walnut Ct, Region	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
1dc6b029-927c-4fa6-a2ae-735b65dcc7d5	Kevin\nMartin	kevin.m@email.com	081234567800	852 Cherry Ln, Area	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
a5ae38d5-ce38-49aa-aa73-96bef65f4c4d	Jennifer\nWhite	jennifer.w@email.com	081234567801	963 Palm Ave, Zone	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
9264fa0e-4245-4d14-9c90-2f7392f0cdde	Christopher Lee	chris.l@email.com	081234567802	159 Beach Rd, Sector	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
11797ef0-fb98-4de4-b0ec-2eb602527b33	Amanda Clark	amanda.c@email.com	081234567803	357 Coast St, District	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
6e272ff2-b48d-47e5-81f5-fd075fd71d95	Daniel Martinez	daniel.m@email.com	081234567804	468 River Dr, County	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
7d8a45c8-e22c-469d-b5a0-3db93d3523e8	Michelle Garcia	michelle.g@email.com	081234567805	789 Lake Ave, State	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
de701ee4-6d3f-48fb-abab-908f2ca3c15c	Andrew Robinson	andrew.r@email.com	081234567806	951 Ocean Blvd,\nProvince	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
9d4e9550-fd21-4872-9d3b-5cdb23e33cea	Patricia Rodriguez	patricia.r@email.com	081234567807	753 Bay St,\nTerritory	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
032a49fb-c92c-417a-ad38-10253ebe30e2	Joseph Hall	joseph.h@email.com	081234567808	246 Harbor Rd,\nRegion	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
e66b85b6-b630-45f5-a08b-1d325905391a	Nicole King	nicole.k@email.com	081234567809	135 Port Ave, Area	2025-06-16 02:18:03.886381	2025-06-16 02:18:03.886381
eb8fb698-42c4-4e8a-afc0-8a157d066a8b	Robby Pratama Putra	robby@email.com	081234567893	Jotang	2025-06-16 06:44:38.439391	2025-06-16 06:44:38.439391
60599b0f-3795-4363-8d0c-9e5638467954	Robby 	robby1@email.com	81234567893	Jotang	2025-06-16 06:48:51.84895	2025-06-16 06:48:51.84895
ec0e81e8-b242-439e-811b-ede073c20cc1	Robby 	robby11@email.com	+81234567893	Jotang	2025-06-16 06:49:07.010193	2025-06-16 06:49:07.010193
\.


--
-- TOC entry 3192 (class 2606 OID 16456)
-- Name: books books_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);


--
-- TOC entry 3194 (class 2606 OID 16454)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 16477)
-- Name: borrowings borrowings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16468)
-- Name: members members_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);


--
-- TOC entry 3198 (class 2606 OID 16466)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16478)
-- Name: borrowings borrowings_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 3202 (class 2606 OID 16483)
-- Name: borrowings borrowings_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


-- Completed on 2025-06-16 11:54:08

--
-- PostgreSQL database dump complete
--

