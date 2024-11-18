--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author nps9
-- @version CS 262 Lab 8
--
SET search_path TO public;

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS buildingLocations;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;



-- Create the schema.ls
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	finished boolean DEFAULT FALSE,
	properties integer[],
	pieceLocation integer
);

CREATE TABLE buildingLocations (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	propertyID integer,
	numberHouses integer,
	numberHotels integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON buildingLocations TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2006-05-20 08:00:00');
INSERT INTO Game VALUES (5, '2005-06-29 10:00:00');
INSERT INTO Game VALUES (6, '2024-10-31 23:59:59');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.com', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.com', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 500, FALSE, '{1, 6, 9, 13}', 17);
INSERT INTO PlayerGame VALUES (1, 2, 1000, FALSE, '{3, 8, 11, 14}', 23);
INSERT INTO PlayerGame VALUES (1, 3, 2350, FALSE, '{5, 12, 15, 18}', 25);
INSERT INTO PlayerGame VALUES (2, 1, 500, FALSE, '{3, 10, 17}', 23);
INSERT INTO PlayerGame VALUES (2, 2, 0, FALSE, '{1, 8, 14, 22}', 29);
INSERT INTO PlayerGame VALUES (2, 3, 5000, FALSE, '{5, 12, 15, 18}', 25);
INSERT INTO PlayerGame VALUES (3, 2, 0, TRUE, '{}', 3);
INSERT INTO PlayerGame VALUES (3, 3, 5500, TRUE, '{5, 12, 15, 18}', 25);
INSERT INTO PlayerGame VALUES (4, 2, 18000, FALSE, '{1, 8, 14, 22}', 29);
INSERT INTO PlayerGame VALUES (4, 1, 1000, FALSE, '{3, 10, 17}', 23);

INSERT INTO buildingLocations VALUES (1, 1, 1, 2, 0);
INSERT INTO buildingLocations VALUES (1, 2, 11, 1, 0);
INSERT INTO buildingLocations VALUES (1, 3, 15, 0, 1);
INSERT INTO buildingLocations VALUES (2, 1, 3, 3, 0);
INSERT INTO buildingLocations VALUES (3, 3, 5, 0, 1);