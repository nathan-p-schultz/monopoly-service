/*
The instructions are as follows:
1. Open the terminal and navigate to the directory containing the Lab08Commands.sql file.
2. Run the database
3. \include monopoly.sql
4. Run the following commands to retrieve the information listed in the comment above the file:
*/


--Exercise 8.1


--a Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT * FROM Game ORDER BY time DESC;


--b Retrieve all the games that occurred in the past week.
SELECT * FROM Game WHERE time > NOW()::DATE - 7;


--c Retrieve a list of players who have (non-NULL) names.
SELECT * FROM Player WHERE name IS NOT NULL;


--d Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT DISTINCT ID FROM Player, PlayerGame WHERE PlayerGame.score > 2000 AND Player.ID = playerID;


--e Retrieve a list of players who have GMail accounts.
SELECT emailAddress FROM Player WHERE emailAddress LIKE '%@gmail.com%';


Exercise 8.2


--a Retrieve all “The King”’s game scores in decreasing order.
SELECT score FROM Player, PlayerGame WHERE Player.ID = playerID AND Player.name = 'The King' ORDER BY score DESC;


--b Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT Player.name FROM Player, PlayerGame, Game WHERE Player.ID = playerID AND PlayerGame.gameID = Game.ID AND Game.time = '2006-06-28 13:20:00' ORDER BY score DESC LIMIT 1;


--c So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
/* The P1.ID < P2. ID clause is used so that the query does not read the relationship between P1 and P2 twice for having the same name. It will check that P1.ID is less than P2.ID so that
hen the query reaches P2 in the table, it won't read the relationship again because the clause will not be true. In short, the clause prevents redundant comparisons of P1 and P2 by name. */


--d The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
/* Self joining can best be used to compare and contrast lines in the same table. It can be used to find duplicate features, and the features that differentiate them. Self-joining could
find all users with the same username, then differentiate those players with the same username using the ID. */
