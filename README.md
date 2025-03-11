# Team of the Decade
In 2020, twelve members of the Dirty Dozen Fantasy Football League celebrated its 10th Anniversary by voting on the best fantasy football players from the past decade (2011-2020).

This repository contains the original tables and the solutions for the prompts that are in this README. Each answer involves real-world SQL problems.

# Questions
**Question 1**: What players appeared on every ballot?

**Question 2**: What players did not appear on any ballots?

**Question 3**: Who are the Top 5 players that received the most points per position?

**_Prompt for Question 4:_**

Points are not equally weighted by position groups. The maximum points a player can receive by position on a single ballot is:
- QB - 8,
- RB - 10,
- WR - 10,
- TE - 6,
- D/ST - 4,
- K - 4

The points a player received divided by the maximum points they could have received with respect to their position is a variable that will be referred to as **points percentage** going forward.

**Question 4**: What players have a points percentage of 75% or greater? Format points percentage as a number rounded two decimal places.

**_Prompt for Question 5:_**

The 2010s Team of the Decade consists of 20 players. The roster consists of 
- 3 Quarterbacks (1 starting, 2 on the bench),
- 6 Running Backs (3 starting, 3 on the bench),
- 6 Wide Receivers (3 starting, 3 on the bench),
- 3 Tight Ends (2 starting, 1 on the bench),
- 1 Defense (1 starting, 0 on the bench),
- 1 Kicker (1 starting, 0 on the bench)

Starting players are those who received the highest points percentage in descending order. Your output should be formatted in a way that:
- Lists starters above bench players,
- Orders by position in custom order, not alphabetically: (QB, RB, WR, TE, D/ST, K),
- Orders by descending position rank.

**Question 5**: Display the Team of the Decade. (HINT: The highest-ranking Quarterback should appear in the first row).

# Skills Used
- Data cleaning
- Performance optimization
- Joins
- Window Functions
- Common Table Expressions (CTEs)
- Subqueries
- Case statements
