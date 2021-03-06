-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE DATABASE tournament;
\c tournament;

DROP TABLE IF EXISTS players; 

CREATE TABLE players (
	player_id SERIAL PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	wins NUMERIC DEFAULT 0,
	matches INTEGER DEFAULT 0
	);

DROP TABLE IF EXISTS matches; 

CREATE TABLE matches (
	match_no SERIAL PRIMARY KEY,
	winner_id INTEGER,
	loser_id INTEGER,
	FOREIGN KEY (winner_id) REFERENCES players(player_id),
	FOREIGN KEY (loser_id) REFERENCES players(player_id)
	);