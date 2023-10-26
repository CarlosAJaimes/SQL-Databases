-- Creation of 'movies' database
CREATE DATABASE IF NOT EXISTS movies;

-- The 'movies' database is used
USE movies;

-- Creation of independent and dependent tables as established
CREATE TABLE actor(
 act_id INT PRIMARY KEY,
 act_fname VARCHAR(20),
 act_lname VARCHAR(20),
 act_gender VARCHAR(1)
 );
 
CREATE TABLE director(
 dir_id INT PRIMARY KEY,
 dir_fname VARCHAR(20),
 dir_lname VARCHAR(20)
 );
 
-- Creation of 'movie' table with 'NOT NULL' constraints
CREATE TABLE IF NOT EXISTS movie(
 mov_id INT NOT NULL,
 mov_title VARCHAR(50) NOT NULL,
 mov_year INT NOT NULL,
 mov_time INT NOT NULL,
 mov_lang VARCHAR(50) NOT NULL,
 mov_dt_rel DATE,
 mov_rel_country VARCHAR(5) NOT NULL,
 PRIMARY KEY (mov_id)
 );
 
CREATE TABLE IF NOT EXISTS movie_cast(
 act_id INT,
 mov_id INT,
 role VARCHAR(30),
 FOREIGN KEY (act_id) REFERENCES actor(act_id),
 FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
 );
 
CREATE TABLE IF NOT EXISTS genres(
 gen_id INT,
 get_title VARCHAR(20),
 PRIMARY KEY (gen_id)
 );
 
CREATE TABLE IF NOT EXISTS reviewer(
 rev_id INT,
 rev_name VARCHAR(30),
 PRIMARY KEY (rev_id)
 );
 
CREATE TABLE IF NOT EXISTS movie_direction(
 dir_id INT,
 mov_id INT,
 FOREIGN KEY (dir_id) REFERENCES director(dir_id),
 FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
 );
 
CREATE TABLE IF NOT EXISTS movie_genres(
 mov_id INT,
 gen_id INT,
 FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
 FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
 );
 
CREATE TABLE IF NOT EXISTS rating(
 mov_id INT,
 rev_id INT,
 rev_stars INT,
 num_o_ratings INT,
 FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
 FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
 );

-- MySQL server configuration

-- The local_infile variable changes from OFF to ON
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;


-- Loading local .tsv files into the 'movies' database

-- Loading data into the 'actor' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/1actor.tsv'
INTO TABLE movies.actor
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'director' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/2director.tsv'
INTO TABLE movies.director
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'movie' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/3movies.tsv'
INTO TABLE movies.movie
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'reviewer' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/5reviewer.tsv'
INTO TABLE movies.reviewer
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'movie_cast' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/9movie_cast.tsv'
INTO TABLE movies.movie_cast
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'movie_direction' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/6movie_direction.tsv'
INTO TABLE movies.movie_direction
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'movie_genres' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/8movie_genres.tsv'
INTO TABLE movies.movie_genres
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

-- Loading data into the 'rating' table
LOAD DATA LOCAL INFILE 'C:/Users/Carlos Jaimes/Desktop/movies_db/7rating.tsv'
INTO TABLE movies.rating
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';
 
  