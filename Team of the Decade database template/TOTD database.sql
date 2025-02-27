-- Create the members table
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(10)
);

-- Insert data into 'members'
INSERT INTO members (member_id, member_name)
VALUES
    (1, 'Aaron'),
    (2, 'Ben'),
    (3, 'Brett'),
    (4, 'Daniel'),
    (5, 'James'),
    (6, 'Jason'),
    (7, 'Michael'),
    (8, 'Nick'),
    (9, 'Ryan'),
    (10, 'Tristan'),
    (11, 'Tyler'),
    (12, 'Zach');

-- Create the positions table
CREATE TABLE positions (
    position_id INT PRIMARY KEY,
    position_name VARCHAR(5) UNIQUE,
    long_name VARCHAR(50)
);

-- Insert data into 'positions'
INSERT INTO positions (position_id, position_name, long_name)
VALUES
    (1, 'QB', 'Quarterback'),
    (2, 'RB', 'Running Back'),
    (3, 'WR', 'Wide Receiver'),
    (4, 'TE', 'Tight End'),
    (5, 'D/ST', 'Defense'),
    (6, 'K', 'Kicker');

-- Create the players table
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    position VARCHAR(5),
    CONSTRAINT fk_player_position
        FOREIGN KEY (position) 
        REFERENCES decade.positions(position_name)
);

-- Insert data into 'players'
INSERT INTO players (player_id, player_name, position)
VALUES
    (1, 'Aaron Jones', 'RB'),
    (2, 'Aaron Rodgers', 'QB'),
    (3, 'Adam Vinatieri', 'K'),
    (4, 'Adrian Peterson', 'RB'),
    (5, 'A.J. Green', 'WR'),
    (6, 'Allen Robinson', 'WR'),
    (7, 'Alvin Kamara', 'RB'),
    (8, 'Amari Cooper', 'WR'),
    (9, 'Andrew Luck', 'QB'),
    (10, 'Andy Dalton', 'QB'),
    (11, 'Antonio Brown', 'WR'),
    (12, 'Antonio Gates', 'TE'),
    (13, 'Arian Foster', 'RB'),
    (14, 'Baltimore Ravens', 'D/ST'),
    (15, 'Ben Roethlisberger', 'QB'),
    (16, 'Brandin Cooks', 'WR'),
    (17, 'Brandon Marshall', 'WR'),
    (18, 'Calvin Johnson', 'WR'),
    (19, 'Calvin Ridley', 'WR'),
    (20, 'Cam Newton', 'QB'),
    (21, 'Chicago Bears', 'D/ST'),
    (22, 'Christian McCaffrey', 'RB'),
    (23, 'Dak Prescott', 'QB'),
    (24, 'Dalvin Cook', 'RB'),
    (25, 'Dan Bailey', 'K'),
    (26, 'Davante Adams', 'WR'),
    (27, 'David Johnson', 'RB'),
    (28, 'DeAndre Hopkins', 'WR'),
    (29, 'Delanie Walker', 'TE'),
    (30, 'DeMarco Murray', 'RB'),
    (31, 'Demaryius Thomas', 'WR'),
    (32, 'Denver Broncos', 'D/ST'),
    (33, 'Derek Carr', 'QB'),
    (34, 'Derrick Henry', 'RB'),
    (35, 'Deshaun Watson', 'QB'),
    (36, 'Devonta Freeman', 'RB'),
    (37, 'Dez Bryant', 'WR'),
    (38, 'Drew Brees', 'QB'),
    (39, 'Eli Manning', 'QB'),
    (40, 'Emmanuel Sanders', 'WR'),
    (41, 'Ezekiel Elliott', 'RB'),
    (42, 'Frank Gore', 'RB'),
    (43, 'George Kittle', 'TE'),
    (44, 'Greg Olsen', 'TE'),
    (45, 'Greg Zuerlein', 'K'),
    (46, 'Harrison Butker', 'K'),
    (47, 'Houston Texans', 'D/ST'),
    (48, 'Jamaal Charles', 'RB'),
    (49, 'James Conner', 'RB'),
    (50, 'Jared Cook', 'TE'),
    (51, 'Jarvis Landry', 'WR'),
    (52, 'Jason Witten', 'TE'),
    (53, 'Jimmy Graham', 'TE'),
    (54, 'Jordy Nelson', 'WR'),
    (55, 'JuJu Smith-Schuster', 'WR'),
    (56, 'Julio Jones', 'WR'),
    (57, 'Justin Tucker', 'K'),
    (58, 'Kansas City Chiefs', 'D/ST'),
    (59, 'Kareem Hunt', 'RB'),
    (60, 'Keenan Allen', 'WR'),
    (61, 'Kirk Cousins', 'QB'),
    (62, 'Kyle Rudolph', 'TE'),
    (63, 'Lamar Jackson', 'QB'),
    (64, 'Lamar Miller', 'RB'),
    (65, 'Larry Fitzgerald', 'WR'),
    (66, 'LeSean McCoy', 'RB'),
    (67, 'LeVeon Bell', 'RB'),
    (68, 'Mark Andrews', 'TE'),
    (69, 'Mark Ingram II', 'RB'),
    (70, 'Marshawn Lynch', 'RB'),
    (71, 'Martellus Bennett', 'TE'),
    (72, 'Mason Crosby', 'K'),
    (73, 'Matt Forte', 'RB'),
    (74, 'Matt Prater', 'K'),
    (75, 'Matt Ryan', 'QB'),
    (76, 'Matthew Stafford', 'QB'),
    (77, 'Melvin Gordon', 'RB'),
    (78, 'Michael Thomas', 'WR'),
    (79, 'Mike Evans', 'WR'),
    (80, 'New England Patriots', 'D/ST'),
    (81, 'Nick Chubb', 'RB'),
    (82, 'Odell Beckham Jr.', 'WR'),
    (83, 'Patrick Mahomes', 'QB'),
    (84, 'Peyton Manning', 'QB'),
    (85, 'Philadelphia Eagles', 'D/ST'),
    (86, 'Philip Rivers', 'QB'),
    (87, 'Rob Gronkowski', 'TE'),
    (88, 'Russell Wilson', 'QB'),
    (89, 'Ryan Tannehill', 'QB'),
    (90, 'San Francisco 49ers', 'D/ST'),
    (91, 'Saquon Barkley', 'RB'),
    (92, 'Seattle Seahawks', 'D/ST'),
    (93, 'Stefon Diggs', 'WR'),
    (94, 'Stephen Gostkowski', 'K'),
    (95, 'Stephen Hauschka', 'K'),
    (96, 'St. Louis/Los Angeles Rams', 'D/ST'),
    (97, 'Todd Gurley II', 'RB'),
    (98, 'Tom Brady', 'QB'),
    (99, 'Tony Gonzalez', 'TE'),
    (100, 'Travis Kelce', 'TE'),
    (101, 'T.Y. Hilton', 'WR'),
    (102, 'Tyreek Hill', 'WR'),
    (103, 'Vernon Davis', 'TE'),
    (104, 'Wil Lutz', 'K'),
    (105, 'Zach Ertz', 'TE');

-- Create the ballots table
CREATE TABLE ballots (
    voter_id INT,
    player_id INT,
    points INT,
    PRIMARY KEY (voter_id, player_id),
    CONSTRAINT fk_ballot_voter
        FOREIGN KEY (voter_id)
        REFERENCES decade.members(member_id),
    CONSTRAINT fk_ballot_player
        FOREIGN KEY (player_id)
        REFERENCES decade.players(player_id)
);

-- Insert data into 'ballots'
INSERT INTO ballots (voter_id, player_id, points)
VALUES
    (1,2,8),
    (1,83,7),
    (1,9,6),
    (1,20,5),
    (1,88,4),
    (1,63,3),
    (1,98,2),
    (1,38,1),
    (1,22,10),
    (1,34,9),
    (1,48,8),
    (1,24,7),
    (1,91,6),
    (1,67,5),
    (1,7,4),
    (1,1,3),
    (1,30,2),
    (1,4,1),
    (1,11,10),
    (1,26,9),
    (1,56,8),
    (1,28,7),
    (1,102,6),
    (1,93,5),
    (1,60,4),
    (1,82,3),
    (1,8,2),
    (1,19,1),
    (1,100,6),
    (1,43,5),
    (1,87,4),
    (1,99,3),
    (1,68,2),
    (1,52,1),
    (1,21,4),
    (1,14,3),
    (1,96,2),
    (1,80,1),
    (1,57,4),
    (1,3,3),
    (1,94,2),
    (1,46,1),
    (2,83,8),
    (2,2,7),
    (2,38,6),
    (2,35,5),
    (2,98,4),
    (2,9,3),
    (2,88,2),
    (2,15,1),
    (2,22,10),
    (2,41,9),
    (2,24,8),
    (2,91,7),
    (2,48,6),
    (2,13,5),
    (2,34,4),
    (2,70,3),
    (2,4,2),
    (2,1,1),
    (2,18,10),
    (2,78,9),
    (2,56,8),
    (2,102,7),
    (2,11,6),
    (2,51,5),
    (2,28,4),
    (2,79,3),
    (2,82,2),
    (2,93,1),
    (2,100,6),
    (2,87,5),
    (2,99,4),
    (2,105,3),
    (2,68,2),
    (2,12,1),
    (2,80,4),
    (2,14,3),
    (2,96,2),
    (2,92,1),
    (2,94,4),
    (2,46,3),
    (2,57,2),
    (2,104,1),
    (3,2,8),
    (3,88,7),
    (3,38,6),
    (3,83,5),
    (3,76,4),
    (3,15,3),
    (3,9,2),
    (3,98,1),
    (3,4,10),
    (3,67,9),
    (3,48,8),
    (3,97,7),
    (3,22,6),
    (3,73,5),
    (3,77,4),
    (3,41,3),
    (3,34,2),
    (3,69,1),
    (3,56,10),
    (3,28,9),
    (3,11,8),
    (3,26,7),
    (3,60,6),
    (3,5,5),
    (3,79,4),
    (3,54,3),
    (3,78,2),
    (3,65,1),
    (3,100,6),
    (3,87,5),
    (3,53,4),
    (3,43,3),
    (3,44,2),
    (3,52,1),
    (3,32,4),
    (3,58,3),
    (3,80,2),
    (3,92,1),
    (3,57,4),
    (3,3,3),
    (3,94,2),
    (3,25,1),
    (4,83,8),
    (4,2,7),
    (4,15,6),
    (4,76,5),
    (4,88,4),
    (4,35,3),
    (4,38,2),
    (4,98,1),
    (4,48,10),
    (4,4,9),
    (4,30,8),
    (4,22,7),
    (4,7,6),
    (4,34,5),
    (4,97,4),
    (4,13,3),
    (4,73,2),
    (4,41,1),
    (4,11,10),
    (4,82,9),
    (4,26,8),
    (4,102,7),
    (4,28,6),
    (4,56,5),
    (4,18,4),
    (4,54,3),
    (4,31,2),
    (4,78,1),
    (4,87,6),
    (4,43,5),
    (4,100,4),
    (4,53,3),
    (4,44,2),
    (4,62,1),
    (4,14,4),
    (4,21,3),
    (4,32,2),
    (4,47,1),
    (4,25,4),
    (4,46,3),
    (4,72,2),
    (4,94,1),
    (5,2,8),
    (5,88,7),
    (5,83,6),
    (5,38,5),
    (5,84,4),
    (5,15,3),
    (5,98,2),
    (5,23,1),
    (5,4,10),
    (5,67,9),
    (5,24,8),
    (5,41,7),
    (5,13,6),
    (5,97,5),
    (5,34,4),
    (5,59,3),
    (5,69,2),
    (5,7,1),
    (5,11,10),
    (5,28,9),
    (5,18,8),
    (5,56,7),
    (5,54,6),
    (5,78,5),
    (5,101,4),
    (5,26,3),
    (5,60,2),
    (5,82,1),
    (5,87,6),
    (5,100,5),
    (5,43,4),
    (5,105,3),
    (5,99,2),
    (5,12,1),
    (5,21,4),
    (5,14,3),
    (5,47,2),
    (5,96,1),
    (5,3,4),
    (5,57,3),
    (5,74,2),
    (5,94,1),
    (6,84,8),
    (6,2,7),
    (6,83,6),
    (6,38,5),
    (6,98,4),
    (6,20,3),
    (6,88,2),
    (6,63,1),
    (6,48,10),
    (6,4,9),
    (6,7,8),
    (6,34,7),
    (6,41,6),
    (6,24,5),
    (6,67,4),
    (6,13,3),
    (6,97,2),
    (6,66,1),
    (6,11,10),
    (6,26,9),
    (6,18,8),
    (6,54,7),
    (6,31,6),
    (6,28,5),
    (6,102,4),
    (6,60,3),
    (6,82,2),
    (6,56,1),
    (6,53,6),
    (6,87,5),
    (6,100,4),
    (6,12,3),
    (6,99,2),
    (6,105,1),
    (6,32,4),
    (6,21,3),
    (6,14,2),
    (6,92,1),
    (6,57,4),
    (6,3,3),
    (6,104,2),
    (6,72,1),
    (7,83,8),
    (7,38,7),
    (7,2,6),
    (7,88,5),
    (7,98,4),
    (7,9,3),
    (7,23,2),
    (7,35,1),
    (7,48,10),
    (7,7,9),
    (7,22,8),
    (7,24,7),
    (7,34,6),
    (7,13,5),
    (7,70,4),
    (7,4,3),
    (7,81,2),
    (7,97,1),
    (7,56,10),
    (7,11,9),
    (7,18,8),
    (7,78,7),
    (7,28,6),
    (7,93,5),
    (7,82,4),
    (7,60,3),
    (7,26,2),
    (7,51,1),
    (7,87,6),
    (7,100,5),
    (7,43,4),
    (7,105,3),
    (7,99,2),
    (7,53,1),
    (7,21,4),
    (7,80,3),
    (7,92,2),
    (7,58,1),
    (7,57,4),
    (7,94,3),
    (7,46,2),
    (7,104,1),
    (8,38,8),
    (8,63,7),
    (8,9,6),
    (8,83,5),
    (8,98,4),
    (8,84,3),
    (8,2,2),
    (8,35,1),
    (8,48,10),
    (8,67,9),
    (8,81,8),
    (8,24,7),
    (8,41,6),
    (8,13,5),
    (8,97,4),
    (8,34,3),
    (8,59,2),
    (8,27,1),
    (8,18,10),
    (8,28,9),
    (8,102,8),
    (8,82,7),
    (8,11,6),
    (8,78,5),
    (8,79,4),
    (8,93,3),
    (8,60,2),
    (8,26,1),
    (8,99,6),
    (8,87,5),
    (8,53,4),
    (8,100,3),
    (8,43,2),
    (8,29,1),
    (8,92,4),
    (8,14,3),
    (8,58,2),
    (8,85,1),
    (8,74,4),
    (8,57,3),
    (8,3,2),
    (8,46,1),
    (9,38,8),
    (9,2,7),
    (9,98,6),
    (9,88,5),
    (9,83,4),
    (9,20,3),
    (9,9,2),
    (9,75,1),
    (9,4,10),
    (9,22,9),
    (9,66,8),
    (9,41,7),
    (9,97,6),
    (9,7,5),
    (9,67,4),
    (9,70,3),
    (9,27,2),
    (9,13,1),
    (9,11,10),
    (9,56,9),
    (9,18,8),
    (9,28,7),
    (9,5,6),
    (9,65,5),
    (9,102,4),
    (9,82,3),
    (9,78,2),
    (9,79,1),
    (9,87,6),
    (9,100,5),
    (9,99,4),
    (9,53,3),
    (9,105,2),
    (9,43,1),
    (9,96,4),
    (9,80,3),
    (9,58,2),
    (9,92,1),
    (9,94,4),
    (9,57,3),
    (9,3,2),
    (9,46,1),
    (10,84,8),
    (10,2,7),
    (10,83,6),
    (10,9,5),
    (10,63,4),
    (10,35,3),
    (10,38,2),
    (10,98,1),
    (10,13,10),
    (10,48,9),
    (10,41,8),
    (10,7,7),
    (10,22,6),
    (10,24,5),
    (10,67,4),
    (10,91,3),
    (10,34,2),
    (10,81,1),
    (10,11,10),
    (10,18,9),
    (10,28,8),
    (10,56,7),
    (10,26,6),
    (10,78,5),
    (10,54,4),
    (10,102,3),
    (10,101,2),
    (10,17,1),
    (10,87,6),
    (10,100,5),
    (10,43,4),
    (10,53,3),
    (10,99,2),
    (10,12,1),
    (10,92,4),
    (10,80,3),
    (10,14,2),
    (10,21,1),
    (10,3,4),
    (10,57,3),
    (10,72,2),
    (10,94,1),
    (11,20,8),
    (11,23,7),
    (11,75,6),
    (11,88,5),
    (11,35,4),
    (11,84,3),
    (11,2,2),
    (11,83,1),
    (11,73,10),
    (11,77,9),
    (11,13,8),
    (11,91,7),
    (11,81,6),
    (11,41,5),
    (11,67,4),
    (11,7,3),
    (11,4,2),
    (11,22,1),
    (11,54,10),
    (11,82,9),
    (11,26,8),
    (11,11,7),
    (11,65,6),
    (11,5,5),
    (11,102,4),
    (11,28,3),
    (11,18,2),
    (11,56,1),
    (11,12,6),
    (11,99,5),
    (11,53,4),
    (11,43,3),
    (11,100,2),
    (11,87,1),
    (11,92,4),
    (11,90,3),
    (11,80,2),
    (11,14,1),
    (11,3,4),
    (11,57,3),
    (11,94,2),
    (11,72,1),
    (12,38,8),
    (12,2,7),
    (12,98,6),
    (12,84,5),
    (12,83,4),
    (12,88,3),
    (12,75,2),
    (12,63,1),
    (12,70,10),
    (12,4,9),
    (12,91,8),
    (12,67,7),
    (12,41,6),
    (12,97,5),
    (12,30,4),
    (12,81,3),
    (12,13,2),
    (12,59,1),
    (12,18,10),
    (12,82,9),
    (12,11,8),
    (12,56,7),
    (12,28,6),
    (12,19,5),
    (12,5,4),
    (12,102,3),
    (12,79,2),
    (12,31,1),
    (12,68,6),
    (12,87,5),
    (12,100,4),
    (12,43,3),
    (12,44,2),
    (12,99,1),
    (12,80,4),
    (12,92,3),
    (12,14,2),
    (12,58,1),
    (12,94,4),
    (12,57,3),
    (12,3,2),
    (12,72,1);