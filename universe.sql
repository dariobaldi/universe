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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    type text DEFAULT 'unkown'::text,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    type text DEFAULT 'unkown'::text,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    type text DEFAULT 'unkown'::text,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255),
    type text DEFAULT 'unkown'::text,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean DEFAULT false,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: traveler; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.traveler (
    traveler_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.traveler OWNER TO freecodecamp;

--
-- Name: traveler_traveler_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.traveler_traveler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.traveler_traveler_id_seq OWNER TO freecodecamp;

--
-- Name: traveler_traveler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.traveler_traveler_id_seq OWNED BY public.traveler.traveler_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: traveler traveler_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler ALTER COLUMN traveler_id SET DEFAULT nextval('public.traveler_traveler_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxia 1', 'Tipo 1', 1, 11, 21.3, false);
INSERT INTO public.galaxy VALUES (2, 'Galaxia 2', 'Tipo 2', 2, 22, 22.3, false);
INSERT INTO public.galaxy VALUES (3, 'Galaxia 3', 'Tipo 3', 3, 33, 23.3, false);
INSERT INTO public.galaxy VALUES (4, 'Galaxia 4', 'Tipo 4', 4, 44, 24.3, false);
INSERT INTO public.galaxy VALUES (5, 'Galaxia 5', 'Tipo 5', 5, 55, 25.3, true);
INSERT INTO public.galaxy VALUES (6, 'Galaxia 0', 'Tipo 0', 0, 10, 20.3, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna 1', 'Tipo 1', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (2, 'Luna 2', 'Tipo 2', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (3, 'Luna 3', 'Tipo 3', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (4, 'Luna 4', 'Tipo 4', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (5, 'Luna 5', 'Tipo 5', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (6, 'Luna 6', 'Tipo 6', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (7, 'Luna 7', 'Tipo 7', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (8, 'Luna 8', 'Tipo 8', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (9, 'Luna 9', 'Tipo 9', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (10, 'Luna 10', 'Tipo 10', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (11, 'Luna 11', 'Tipo 11', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (12, 'Luna 12', 'Tipo 12', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (13, 'Luna 13', 'Tipo 13', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (14, 'Luna 14', 'Tipo 14', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (15, 'Luna 15', 'Tipo 15', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (16, 'Luna 16', 'Tipo 16', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (17, 'Luna 17', 'Tipo 17', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (18, 'Luna 18', 'Tipo 18', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (19, 'Luna 19', 'Tipo 19', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (20, 'Luna 20', 'Tipo 20', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (21, 'Luna 21', 'Tipo 21', 1, 2, 3.45, false, false, 11);
INSERT INTO public.moon VALUES (22, 'Luna 22', 'Tipo 22', 1, 2, 3.45, false, false, 12);
INSERT INTO public.moon VALUES (23, 'Luna 23', 'Tipo 23', 1, 2, 3.45, false, false, 12);
INSERT INTO public.moon VALUES (24, 'Luna 24', 'Tipo 24', 1, 2, 3.45, false, false, 12);
INSERT INTO public.moon VALUES (25, 'Luna 25', 'Tipo 25', 1, 2, 3.45, false, false, 12);
INSERT INTO public.moon VALUES (26, 'Luna 26', 'Tipo 26', 1, 2, 3.45, false, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', 'Type 1', 1, 2, 4.3, false, true, 2);
INSERT INTO public.planet VALUES (2, 'Planet 2', 'Type 2', 1, 2, 4.3, false, true, 4);
INSERT INTO public.planet VALUES (3, 'Planet 3', 'Type 3', 1, 2, 4.3, true, true, 4);
INSERT INTO public.planet VALUES (4, 'Planet 4', 'Type 4', 1, 2, 4.3, true, true, 4);
INSERT INTO public.planet VALUES (5, 'Planet 5', 'Type 5', 1, 2, 4.3, true, true, 4);
INSERT INTO public.planet VALUES (6, 'Planet 6', 'Type 6', 1, 2, 4.3, true, true, 4);
INSERT INTO public.planet VALUES (7, 'Planet 7', 'Type 7', 1, 2, 4.3, false, true, 4);
INSERT INTO public.planet VALUES (8, 'Planet 8', 'Type 8', 1, 2, 4.3, false, true, 4);
INSERT INTO public.planet VALUES (9, 'Planet 9', 'Type 9', 1, 2, 4.3, false, true, 4);
INSERT INTO public.planet VALUES (10, 'Planet 10', 'Type 10', 1, 2, 4.3, false, true, 4);
INSERT INTO public.planet VALUES (11, 'Planet 11', 'Type 11', 1, 2, 4.3, true, true, 6);
INSERT INTO public.planet VALUES (12, 'Planet 12', 'Type 12', 1, 2, 4.3, true, true, 6);
INSERT INTO public.planet VALUES (13, 'Planet 13', 'Type 13', 1, 2, 4.3, true, true, 6);
INSERT INTO public.planet VALUES (14, 'Planet 14', 'Type 14', 1, 2, 4.3, true, true, 6);
INSERT INTO public.planet VALUES (15, 'Planet 15', 'Type 15', 1, 2, 4.3, false, true, 6);
INSERT INTO public.planet VALUES (16, 'Planet 16', 'Type 16', 1, 2, 4.3, false, false, 6);
INSERT INTO public.planet VALUES (17, 'Planet 17', 'Type 17', 1, 2, 4.3, false, false, 6);
INSERT INTO public.planet VALUES (18, 'Planet 18', 'Type 18', 1, 2, 4.3, false, false, 6);
INSERT INTO public.planet VALUES (19, 'Planet 19', 'Type 19', 1, 2, 4.3, false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', 'Type 1', 1, 2, 3.14, false, 1);
INSERT INTO public.star VALUES (2, 'Star 2', 'Type 2', 1, 2, 3.14, false, 2);
INSERT INTO public.star VALUES (3, 'Star 3', 'Type 3', 1, 2, 3.14, false, 2);
INSERT INTO public.star VALUES (4, 'Star 4', 'Type 4', 1, 2, 3.14, false, 2);
INSERT INTO public.star VALUES (5, 'Star 5', 'Type 5', 1, 2, 3.14, false, 2);
INSERT INTO public.star VALUES (6, 'Star 6', 'Type 6', 1, 2, 3.14, false, 5);
INSERT INTO public.star VALUES (7, 'Star 7', 'Type 7', 1, 2, 3.14, false, 5);


--
-- Data for Name: traveler; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.traveler VALUES (1, 'Juan', 1);
INSERT INTO public.traveler VALUES (2, 'Flavia', 1);
INSERT INTO public.traveler VALUES (3, 'Pedri', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: traveler_traveler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.traveler_traveler_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: traveler traveler_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler
    ADD CONSTRAINT traveler_name_key UNIQUE (name);


--
-- Name: traveler traveler_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler
    ADD CONSTRAINT traveler_pkey PRIMARY KEY (traveler_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: traveler traveler_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler
    ADD CONSTRAINT traveler_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

