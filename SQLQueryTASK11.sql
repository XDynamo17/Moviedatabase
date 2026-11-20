CREATE DATABASE MovieDB;
GO
USE MovieDB;
GO
CREATE TABLE actor (
    act_id INT NOT NULL,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1),
    CONSTRAINT PK_actor PRIMARY KEY (act_id)
);
CREATE TABLE director (
    dir_id INT NOT NULL,
    dir_fname CHAR(20),
    dir_lname CHAR(20),
    CONSTRAINT PK_director PRIMARY KEY (dir_id)
);

CREATE TABLE movie (
    mov_id INT NOT NULL,
    mov_title CHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5),
    CONSTRAINT PK_movie PRIMARY KEY (mov_id)
);

CREATE TABLE genres (
    gen_id INT NOT NULL,
    gen_title CHAR(20),
    CONSTRAINT PK_genres PRIMARY KEY (gen_id)
);

CREATE TABLE reviewer (
    rev_id INT NOT NULL,
    rev_name CHAR(30),
    CONSTRAINT PK_reviewer PRIMARY KEY (rev_id)
);

CREATE TABLE movie_direction (
    dir_id INT NOT NULL,
    mov_id INT NOT NULL,
    CONSTRAINT PK_movie_direction PRIMARY KEY (dir_id, mov_id),
    CONSTRAINT FK_movie_direction_director FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    CONSTRAINT FK_movie_direction_movie FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_cast (
    act_id INT NOT NULL,
    mov_id INT NOT NULL,
    role CHAR(30),
    CONSTRAINT PK_movie_cast PRIMARY KEY (act_id, mov_id),
    CONSTRAINT FK_movie_cast_actor FOREIGN KEY (act_id) REFERENCES actor(act_id),
    CONSTRAINT FK_movie_cast_movie FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_genres (
    mov_id INT NOT NULL,
    gen_id INT NOT NULL,
    CONSTRAINT PK_movie_genres PRIMARY KEY (mov_id, gen_id),
    CONSTRAINT FK_movie_genres_movie FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    CONSTRAINT FK_movie_genres_genres FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE rating (
    mov_id INT NOT NULL,
    rev_id INT NOT NULL,
    rev_stars INT,
    num_o_ratings INT,
    CONSTRAINT PK_rating PRIMARY KEY (mov_id, rev_id),
    CONSTRAINT FK_rating_movie FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    CONSTRAINT FK_rating_reviewer FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);