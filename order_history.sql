--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: order_details; Type: TABLE; Schema: public; Owner: maulanazn
--

CREATE TABLE public.order_details (
    id character varying(100) NOT NULL,
    order_id character varying(100) NOT NULL,
    product_id character varying(100) NOT NULL,
    product_name character varying(250) NOT NULL,
    product_weight integer NOT NULL,
    product_price bigint NOT NULL,
    quantity integer NOT NULL,
    total_amount bigint NOT NULL
);


ALTER TABLE public.order_details OWNER TO maulanazn;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: maulanazn
--

CREATE TABLE public.orders (
    id character varying(100) NOT NULL,
    seller_id character varying(100) NOT NULL,
    seller_name character varying(100) NOT NULL,
    buyer_id character varying(100) NOT NULL,
    buyer_name character varying(100) NOT NULL,
    shipping_name character varying(100) NOT NULL,
    shipping_address character varying(500) NOT NULL,
    shipping_phone character varying(25) NOT NULL,
    logistic_id character varying(100) NOT NULL,
    logistic_name character varying(100) NOT NULL,
    payment_method_id character varying(100) NOT NULL,
    payment_method_name character varying(100) NOT NULL,
    total_quantity integer NOT NULL,
    total_weight integer NOT NULL,
    total_product_amount bigint NOT NULL,
    total_shipping_cost bigint NOT NULL,
    total_shipping_amount bigint NOT NULL,
    service_charge bigint NOT NULL,
    total_amount bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO maulanazn;

--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: maulanazn
--

COPY public.order_details (id, order_id, product_id, product_name, product_weight, product_price, quantity, total_amount) FROM stdin;
1	INV332	Robot keyboard	Robot Keyboard	850	20000	1	1
2	INV319	Rexus Gaming Earphone	Rexus Gaming earphone with dual microphone	600	140000	1	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: maulanazn
--

COPY public.orders (id, seller_id, seller_name, buyer_id, buyer_name, shipping_name, shipping_address, shipping_phone, logistic_id, logistic_name, payment_method_id, payment_method_name, total_quantity, total_weight, total_product_amount, total_shipping_cost, total_shipping_amount, service_charge, total_amount, created_at) FROM stdin;
INV332	Liem	Liem Group	maulana zn	maulanazn	maulana	Wherever i live	012931232	SiCepat	SiCepat - Regular Package	Alfamart	Alfamart	1	850	1	18000	1	2500	20000	2023-07-02 13:23:03.873682
INV319	Rexus	Rexus Official Store	maulana zn	maulanazn	maulana	Wherever i live	012931232	JNE	JNE - Reguler	Alfamart	Alfamart	1	600	1	139000	1	2500	140000	2023-07-02 13:29:19.970756
\.


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: maulanazn
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: maulanazn
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maulanazn
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

