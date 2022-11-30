-- DROP TABLE tickets CASCADE;
-- DROP TABLE sessions CASCADE;
-- DROP TABLE staff CASCADE;
-- DROP TABLE passport CASCADE;
-- DROP TABLE positions CASCADE;
-- DROP TABLE hall CASCADE;
-- DROP TABLE anime_genre CASCADE;
-- DROP TABLE anime CASCADE;
-- DROP TABLE genre CASCADE;


CREATE TABLE IF NOT EXISTS passport
(
    passport_id serial PRIMARY KEY,
    birth_date date NOT NULL, 
    sex varchar(50) NOT NULL,
    residence_address varchar(50) NOT NULL,
    IIN char(14) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS positions
(
    position_id serial PRIMARY KEY,
    pos_name varchar(50) NOT NULL, 
    salary int NOT NULL
);


CREATE TABLE IF NOT EXISTS staff
(
    staff_id serial PRIMARY KEY,
    first_name varchar(50) NOT NULL,
	middle_name varchar(50) NOT NULL DEFAULT '',
    last_name varchar(50) NOT NULL,
    tel char(13) UNIQUE NOT NULL,
    email varchar(50) NOT NULL,
	passport_id int REFERENCES passport(passport_id),
	position_id int REFERENCES positions(position_id)
);


CREATE TABLE IF NOT EXISTS hall
(
    hall_id serial PRIMARY KEY,
   	hall_name varchar(50) NOT NULL, 
    capacity int NOT NULL
);


CREATE TABLE IF NOT EXISTS genre
(
    genre_id serial PRIMARY KEY,
    genre_name varchar(50) NOT NULL, 
    description text NOT NULL	
);


CREATE TABLE IF NOT EXISTS anime
(
    anime_id serial PRIMARY KEY,
    anime_name varchar(200) NOT NULL,
	release_date date NOT NULL,
    duration time NOT NULL
);


CREATE TABLE IF NOT EXISTS anime_genre
(
    anime_id int REFERENCES anime(anime_id),
	genre_id int REFERENCES genre(genre_id)
);


CREATE TABLE IF NOT EXISTS sessions
(
    session_id serial PRIMARY KEY,
    anime_id int REFERENCES anime(anime_id),
	hall_id int REFERENCES hall(hall_id),
	staff_id int REFERENCES staff(staff_id),
	sess_date date NOT NULL,
	sess_time time NOT NULL
);


CREATE TABLE IF NOT EXISTS tickets
(
    ticket_id serial PRIMARY KEY,
    price int NOT NULL,
	row_ int NOT NULL,
	place int NOT NULL,
	session_id int REFERENCES sessions(session_id),
	availability bool NOT NULL DEFAULT TRUE
);


CREATE TABLE IF NOT EXISTS logging
(
    log_id serial PRIMARY KEY,
    log_message varchar(100) NOT NULL,
    staff_id int REFERENCES staff(staff_id)
);