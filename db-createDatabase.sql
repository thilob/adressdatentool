-- Schritt 1: Benutzer erstellen
-- Notwendig: Account mit Superuser-Eigenschaften, z.B. user: postgres
-- Role: cebiusdaten
DROP ROLE IF EXISTS cebiusdaten;

CREATE ROLE cebiusdaten WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:5Mq5l+WK6btSCYz5Y/oiAQ==$RAzWRLbYWb/LqRo03UN6uTbUbfbX4YBYVZIIkgPLc4w=:TqRN/9cLf9yhZVfTJkfhBtKczgsvLInVolXKEn8NoQ4=';

  -- Schritt 2: Datenbank erstellen
  -- Database: cebiusdaten
DROP DATABASE IF EXISTS cebiusdaten;

CREATE DATABASE cebiusdaten
    WITH
    OWNER = cebiusdaten
    ENCODING = 'UTF8'
    LC_COLLATE = 'C.UTF-8'
    LC_CTYPE = 'C.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

GRANT CREATE, CONNECT ON DATABASE cebiusdaten TO cebiusdaten;
GRANT TEMPORARY ON DATABASE cebiusdaten TO cebiusdaten WITH GRANT OPTION;
--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--
CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


-- Schritt 3: Tabellen und andere Objekte anlegen
