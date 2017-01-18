CREATE TABLE movies(
id INT PRIMARY KEY,
name TEXT DEFAULT NULL,
year INT DEFAULT NULL,
rank REAL DEFAULT NULL);

CREATE actors(
id INT PRIMARY KEY,
first_name TEXT DEFAULT NULL,
last_name TEXT DEFAULT NULL,
gender TEXT DEFAULT NULL
);

CREATE roles(
actor_id INT,
movie_id INT,
role_name TEXT DEFAULT NULL);