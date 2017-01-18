//CAR
SELECT * FROM movies
 WHERE name LIKE '%CAR';

//Birthyear
SELECT * FROM movies
 WHERE year = 1984;

//1982
SELECT COUNT(*) FROM movies
  WHERE year = 1982;

//Stacktors
SELECT * FROM actors
  WHERE last_name LIKE '%STACK%';

//Fame Name Game
SELECT COUNT(*) AS counts, first_name
  FROM actors
  GROUP BY first_name
  ORDER BY counts DESC
  LIMIT 10;


SELECT COUNT(*) AS counts, last_name
  FROM actors
  GROUP BY last_name
  ORDER BY counts DESC
  LIMIT 10;

//Prolific

SELECT first_name, last_name, COUNT(*) AS counts
FROM actors
  INNER JOIN roles
  ON actors.id = roles.actor_id
  GROUP BY actors.id
  ORDER BY counts DESC
  LIMIT 100;

//Bottom of the Barrels

SELECT genre, COUNT(*) AS num_movies FROM
   movies INNER JOIN
   movies_genres ON
   movies.id = movies_genres.movie_id
  GROUP BY genre
  ORDER BY num_movies ASC;


//Braveheart

SELECT first_name, last_name FROM
  actors INNER JOIN
  roles ON
  actors.id = actor_id INNER JOIN
  movies ON
  roles.movie_id = movies.id
WHERE movies.name = "Braveheart"
ORDER BY last_name ASC;


//LEAP_NOIR
SELECT directors.first_name, directors.last_name, movies.name, movies.year FROM
  directors INNER JOIN movies_directors
  ON directors.id = movies_directors.director_id
  INNER JOIN movies
  ON movies_directors.movie_id = movies.id
  INNER JOIN movies_genres
  ON movies_genres.movie_id = movies.id
WHERE movies_genres.genre = 'Film-Noir' AND movies.year % 4 = 0
GROUP BY movies.name;

//Bacon

SELECT BACONATOR.movies_name AS name, actors.first_name AS first_name, actors.last_name AS last_name FROM
      (SELECT actors.id AS BaconID, actors.first_name AS first_name, actors.last_name AS last_name, movies.name AS movies_name, movies.id AS movies_id FROM actors INNER JOIN roles
        ON actors.id = roles.actor_id INNER JOIN movies
        ON roles.movie_id = movies.id INNER JOIN movies_genres
        ON movies.id = movies_genres.movie_id
      WHERE movies_genres.genre = 'Drama' AND actors.first_name = 'Kevin' AND actors.last_name = 'Bacon') BACONATOR
INNER JOIN roles ON BACONATOR.movies_id = roles.movie_id INNER JOIN actors ON roles.actor_id = actors.id WHERE
actors.id != BACONATOR.BaconID LIMIT 50;

//Immortal

SELECT first_name, last_name FROM
(SELECT actors.first_name AS first_name, actors.last_name as last_name FROM actors
INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON roles.movie_id = movies.id WHERE
movies.year < 1900) MOVIESPRE1900
  INTERSECT
SELECT first_name, last_name FROM
(SELECT actors.first_name AS first_name, actors.last_name AS last_name FROM actors
INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON roles.movie_id = movies.id WHERE
movies.year > 2000) MOVIESAFTER2000;


//Busy Filming

SELECT actors.first_name AS first_name, actors.last_name AS last_name,
    movies.name AS movie_name, movies.year as year, COUNT(DISTINCT roles.role) AS num_roles
    FROM actors INNER JOIN roles ON
    actors.id = roles.actor_id
    INNER JOIN movies ON roles.movie_id = movies.id
    WHERE movies.year > 1990
    GROUP BY actors.id, movies.id
    HAVING num_roles >= 5;



























