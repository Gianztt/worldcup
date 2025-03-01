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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (62, 63, 1, 2018, 'Final', 4, 2);
INSERT INTO public.games VALUES (64, 65, 2, 2018, 'Third Place', 2, 0);
INSERT INTO public.games VALUES (63, 65, 3, 2018, 'Semi-Final', 2, 1);
INSERT INTO public.games VALUES (62, 64, 4, 2018, 'Semi-Final', 1, 0);
INSERT INTO public.games VALUES (63, 66, 5, 2018, 'Quarter-Final', 3, 2);
INSERT INTO public.games VALUES (65, 67, 6, 2018, 'Quarter-Final', 2, 0);
INSERT INTO public.games VALUES (64, 68, 7, 2018, 'Quarter-Final', 2, 1);
INSERT INTO public.games VALUES (62, 69, 8, 2018, 'Quarter-Final', 2, 0);
INSERT INTO public.games VALUES (65, 70, 9, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (67, 71, 10, 2018, 'Eighth-Final', 1, 0);
INSERT INTO public.games VALUES (64, 72, 11, 2018, 'Eighth-Final', 3, 2);
INSERT INTO public.games VALUES (68, 73, 12, 2018, 'Eighth-Final', 2, 0);
INSERT INTO public.games VALUES (63, 74, 13, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (66, 75, 14, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (69, 76, 15, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (62, 77, 16, 2018, 'Eighth-Final', 4, 3);
INSERT INTO public.games VALUES (78, 77, 17, 2014, 'Final', 1, 0);
INSERT INTO public.games VALUES (79, 68, 18, 2014, 'Third Place', 3, 0);
INSERT INTO public.games VALUES (77, 79, 19, 2014, 'Semi-Final', 1, 0);
INSERT INTO public.games VALUES (78, 68, 20, 2014, 'Semi-Final', 7, 1);
INSERT INTO public.games VALUES (79, 80, 21, 2014, 'Quarter-Final', 1, 0);
INSERT INTO public.games VALUES (77, 64, 22, 2014, 'Quarter-Final', 1, 0);
INSERT INTO public.games VALUES (68, 70, 23, 2014, 'Quarter-Final', 2, 1);
INSERT INTO public.games VALUES (78, 62, 24, 2014, 'Quarter-Final', 1, 0);
INSERT INTO public.games VALUES (68, 81, 25, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (70, 69, 26, 2014, 'Eighth-Final', 2, 0);
INSERT INTO public.games VALUES (62, 82, 27, 2014, 'Eighth-Final', 2, 0);
INSERT INTO public.games VALUES (78, 83, 28, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (79, 73, 29, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (80, 84, 30, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (77, 71, 31, 2014, 'Eighth-Final', 1, 0);
INSERT INTO public.games VALUES (64, 85, 32, 2014, 'Eighth-Final', 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (62, 'France');
INSERT INTO public.teams VALUES (63, 'Croatia');
INSERT INTO public.teams VALUES (64, 'Belgium');
INSERT INTO public.teams VALUES (65, 'England');
INSERT INTO public.teams VALUES (66, 'Russia');
INSERT INTO public.teams VALUES (67, 'Sweden');
INSERT INTO public.teams VALUES (68, 'Brazil');
INSERT INTO public.teams VALUES (69, 'Uruguay');
INSERT INTO public.teams VALUES (70, 'Colombia');
INSERT INTO public.teams VALUES (71, 'Switzerland');
INSERT INTO public.teams VALUES (72, 'Japan');
INSERT INTO public.teams VALUES (73, 'Mexico');
INSERT INTO public.teams VALUES (74, 'Denmark');
INSERT INTO public.teams VALUES (75, 'Spain');
INSERT INTO public.teams VALUES (76, 'Portugal');
INSERT INTO public.teams VALUES (77, 'Argentina');
INSERT INTO public.teams VALUES (78, 'Germany');
INSERT INTO public.teams VALUES (79, 'Netherlands');
INSERT INTO public.teams VALUES (80, 'Costa Rica');
INSERT INTO public.teams VALUES (81, 'Chile');
INSERT INTO public.teams VALUES (82, 'Nigeria');
INSERT INTO public.teams VALUES (83, 'Algeria');
INSERT INTO public.teams VALUES (84, 'Greece');
INSERT INTO public.teams VALUES (85, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 85, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

