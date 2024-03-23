--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255),
    age_in_thousand_years integer
);


ALTER TABLE public.comet OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.comet ALTER COLUMN comet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comet_comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    number_of_stars integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius_in_thousands_km numeric(30,3),
    description text,
    is_far boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(255),
    radius_in_km integer NOT NULL,
    is_single boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(255),
    description text,
    radius_in_km integer NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(255),
    description text,
    is_dying boolean
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (1, 'Comet 1', 12345);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (2, 'Comet 2', 22222);
INSERT INTO public.comet OVERRIDING SYSTEM VALUE VALUES (3, 'Comet 3', 54322);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Galaxy 1', 1, 1234, 1111.000, 'Description 1', false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Galaxy 2', 1, 2222, 2211.000, 'Description 2', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Galaxy 3', 2, 3333, 3322.000, 'Description 2', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Galaxy 4', 1, 4444, 4433.000, 'Description 2', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Galaxy 5', 1, 5555, 5544.000, 'Description 2', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Galaxy 6', 1, 6666, 6655.000, 'Description 2', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Galaxy 1 - star 1 - planet 1 - moon 1', 456, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Galaxy 2 - star 1 - planet 1 - moon 1', 912, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Galaxy 3 - star 1 - planet 1 - moon 1', 1368, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 4, 'Galaxy 4 - star 1 - planet 1 - moon 1', 1824, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Galaxy 5 - star 1 - planet 1 - moon 1', 2280, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 6, 'Galaxy 6 - star 1 - planet 1 - moon 1', 2736, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 7, 'Galaxy 1 - star 1 - planet 2 - moon 1', 3192, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 8, 'Galaxy 2 - star 1 - planet 2 - moon 1', 3648, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 9, 'Galaxy 3 - star 1 - planet 2 - moon 1', 4104, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 10, 'Galaxy 4 - star 1 - planet 2 - moon 1', 4560, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 11, 'Galaxy 5 - star 1 - planet 2 - moon 1', 5016, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 12, 'Galaxy 6 - star 1 - planet 2 - moon 1', 5472, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 1, 'Galaxy 1 - star 1 - planet 1 - moon 2', 555, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 2, 'Galaxy 2 - star 1 - planet 1 - moon 2', 1110, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 3, 'Galaxy 3 - star 1 - planet 1 - moon 2', 1665, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 4, 'Galaxy 4 - star 1 - planet 1 - moon 2', 2220, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 5, 'Galaxy 5 - star 1 - planet 1 - moon 2', 2775, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 6, 'Galaxy 6 - star 1 - planet 1 - moon 2', 3330, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 7, 'Galaxy 1 - star 1 - planet 2 - moon 2', 3885, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 8, 'Galaxy 2 - star 1 - planet 2 - moon 2', 4440, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (21, 9, 'Galaxy 3 - star 1 - planet 2 - moon 2', 4995, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (22, 10, 'Galaxy 4 - star 1 - planet 2 - moon 2', 5550, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (23, 11, 'Galaxy 5 - star 1 - planet 2 - moon 2', 6105, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (24, 12, 'Galaxy 6 - star 1 - planet 2 - moon 2', 6660, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Galaxy 1 - star 1 - planet 1', NULL, 1000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Galaxy 2 - star 1 - planet 1', NULL, 2000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Galaxy 3 - star 1 - planet 1', NULL, 3000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 4, 'Galaxy 4 - star 1 - planet 1', NULL, 4000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Galaxy 5 - star 1 - planet 1', NULL, 5000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 6, 'Galaxy 6 - star 1 - planet 1', NULL, 6000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 1, 'Galaxy 1 - star 1 - planet 2', NULL, 2000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 2, 'Galaxy 2 - star 1 - planet 2', NULL, 4000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 3, 'Galaxy 3 - star 1 - planet 2', NULL, 6000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 4, 'Galaxy 4 - star 1 - planet 2', NULL, 8000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 5, 'Galaxy 5 - star 1 - planet 2', NULL, 10000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 6, 'Galaxy 6 - star 1 - planet 2', NULL, 12000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Galaxy 1 - star 1', NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Galaxy 2 - star 1', NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Galaxy 3 - star 1', NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 4, 'Galaxy 4 - star 1', NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Galaxy 5 - star 1', NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 6, 'Galaxy 6 - star 1', NULL, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

