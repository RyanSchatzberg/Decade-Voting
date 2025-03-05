-- Question 1) What players appeared on every ballot?
SELECT pl.player_name, 
    pl.position, 
    COUNT(*) AS number_of_ballots
FROM decade.ballots as b
INNER JOIN decade.players as pl
ON b.player_id = pl.player_id
GROUP BY pl.player_name, pl.position
HAVING COUNT(*) = 12 -- There are 12 members, so there are 12 ballots.
ORDER BY number_of_ballots DESC;

-- Question 2) What players appeared on none of the ballots?
SELECT pl.player_name, 
    pl.position
FROM decade.players as pl
LEFT JOIN decade.ballots as b
ON pl.player_id = b.player_id
WHERE b.player_id IS NULL;

-- Question 3) Who were the Top 5 players that received the most points per position? Query all the position groups.
WITH ranked_players AS ( -- To put all the results into one query instead of making six separate queries for each position group, we're creating our first CTE.
    SELECT 
        pl.player_name, 
        pl.position, 
        SUM(b.points) AS points,
        ROW_NUMBER() OVER (PARTITION BY pl.position ORDER BY SUM(b.points) DESC) AS rank -- ROW_NUMBER() assigns a unique number to each row based on the order specified in the OVER clause.
    FROM decade.ballots AS b
    INNER JOIN decade.players AS pl
    ON b.player_id = pl.player_id
    GROUP BY pl.player_name, pl.position
)
SELECT rank, position, player_name
FROM ranked_players
WHERE rank <= 5
ORDER BY position, rank;

-- Three CTEs are displayed below. The first two will need to be used to answer Question 4. All three will be used to answer question 5.
-- CTE Prompt for Question 4: The most points a player can receive on each position group is: QB = 96, RB = 120, WR = 120, TE = 72, D/ST = 48, K=48. The next few questions will seek to solve what players have the most points relative to their position maximum (this variable will be referred to as points percentage going forward).
WITH ballot_count AS ( -- The number of ballots are now a variable
    SELECT COUNT(*) AS total_ballots FROM decade.members
),
max_possible_points AS (
    SELECT 'QB' AS position, 8 * total_ballots AS max_points FROM ballot_count -- Maximum points per Quarterbacks; 96 / 12 = 8.
    UNION ALL
    SELECT 'RB', 10 * total_ballots FROM ballot_count -- Maximum points per Running Backs; 120 / 12 = 10.
    UNION ALL
    SELECT 'WR', 10 * total_ballots FROM ballot_count -- Maximum points per Wide Receivers; 120 / 12 = 10.
    UNION ALL
    SELECT 'TE', 6 * total_ballots FROM ballot_count -- Maximum points per Tight Ends; 72 / 12 = 6.
    UNION ALL
    SELECT 'D/ST', 4 * total_ballots FROM ballot_count -- Maximum points per Defenses; 48 / 12 = 4.
    UNION ALL
    SELECT 'K', 4 * total_ballots FROM ballot_count -- Maximum points per Kickers; 48 / 12 = 4.
),
-- CTE prompt for Question 5: The 2010s Team of the Decade consists of a total of 19 players (11 starting, 8 on the bench). 3 Quarterbacks (1 starting), 5 Running Backs (3 starting), 6 Wide Receivers (3 starting), 3 Tight Ends (2 starting), 1 Defense (starting), and 1 kicker (starting).
starting_lineup AS (
    SELECT ROW_NUMBER() OVER(PARTITION BY pl.position ORDER BY SUM(b.points) DESC) AS position_rank,
        pl.position, 
        pl.player_name,
        SUM(b.points) AS points,
        ROUND(SUM(b.points) * 1.0 / MAX(mpp.max_points) * 100, 2) AS points_pct -- Because this line helps us answer Question 4, and Question 4 helps us answer Question 5, this line must appear in the CTE.
    FROM decade.players AS pl
    INNER JOIN decade.ballots AS b
    ON pl.player_id = b.player_id
    INNER JOIN max_possible_points AS mpp -- CTE join
    ON pl.position = mpp.position
    GROUP BY pl.position, pl.player_name, mpp.max_points
)

-- Question 4) What other players have a points percentage of 75% or greater? Order by descending points percentage. Format the output as a percentage rounded two decimal places.
SELECT pl.player_name,
    pl.position,
    SUM(b.points) AS points,
    ROUND(SUM(b.points) * 1.0 / MAX(mpp.max_points) * 100, 2) AS points_pct -- b.points and mpp.max_points are both integers; we want the output to appear as a percentage rounded to 2 decimal places. 
FROM decade.players AS pl
INNER JOIN decade.ballots AS b
ON pl.player_id = b.player_id
INNER JOIN max_possible_points AS mpp -- CTE join
ON pl.position = mpp.position
GROUP BY pl.player_name, pl.position, mpp.max_points
HAVING ROUND(SUM(b.points) * 1.0 / MAX(mpp.max_points) * 100, 2) >= 75 -- We have to write the original line of code instead of its alias due to order of execution.
ORDER BY points_pct DESC;

-- Question 5) Find out the players that made the 2010s Team of the Decade based on this table you’ve created. Find out what players started, and which players made the bench. For players in the same position group, the player with more points should appear above the other players in their group.
SELECT sl.position, 
    sl.player_name, 
    sl.points, 
    sl.points_pct,
    CASE -- Per the prompt, we need to put constraints on position rank to determine which players are considered 'Starters'.
        WHEN (sl.position IN ('QB', 'D/ST', 'K') AND sl.position_rank = 1)
            OR (sl.position IN ('RB', 'WR') AND sl.position_rank <= 3)
            OR (sl.position = 'TE' AND sl.position_rank <= 2)
        THEN 'Starter'
        ELSE 'Bench'
    END AS player_type
FROM starting_lineup AS sl
JOIN max_possible_points AS mpp
ON sl.position = mpp.position
WHERE 
    -- Starter conditions.
    (sl.position IN ('QB', 'D/ST', 'K') AND sl.position_rank = 1)
    OR (sl.position IN ('RB', 'WR') AND sl.position_rank <= 3)
    OR (sl.position = 'TE' AND sl.position_rank <= 2)
    -- Bench conditions.
    OR (sl.position = 'QB' AND sl.position_rank BETWEEN 2 AND 3)
    OR (sl.position = 'RB' AND sl.position_rank BETWEEN 4 AND 5)
    OR (sl.position = 'WR' AND sl.position_rank BETWEEN 4 AND 6)
    OR (sl.position = 'TE' AND sl.position_rank = 3)
ORDER BY
    CASE
        WHEN (sl.position IN ('QB', 'D/ST', 'K') AND sl.position_rank = 1)
            OR (sl.position IN ('RB', 'WR') AND sl.position_rank <= 3)
            OR (sl.position = 'TE' AND sl.position_rank <= 2)
        THEN 1 -- Starter
        ELSE 2 -- Bench
    END,
    CASE
        WHEN sl.position = 'QB' THEN 1
        WHEN sl.position = 'RB' THEN 2
        WHEN sl.position = 'WR' THEN 3
        WHEN sl.position = 'TE' THEN 4
        WHEN sl.position = 'D/ST' THEN 5
        ELSE 6
    END, 
    sl.position_rank ASC;

-- BONUS: Question 6) What member's ballot most closely resembles the final Team of the Decade queried in Question 5?