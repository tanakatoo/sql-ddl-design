--The standings/rankings of each team in the league 
--(This doesn’t have to be its own table if the data can be captured somehow).

--without using "winner_team_id" column,
--1. Get the total goals for each team for each game and determine who won for each game
--2. For each team in the league, determine who won the most games (from above) and order them in descending order
--Can we do this in one sql statement? How?

--using the "winner_team_id" column
--is it ok to do this - it seems like it's duplicated info but hard to get info.

select count(m.winner_team_id), l.name, t.name
from matches m
left join teams_leagues tl
    on teams_id = winner_team_id
left join leagues l
    on tl.leagues_id = leagues.id
left join teams t
    on t.id = m.winner_team_id
group by t.name
order by l.leagues_id, m.winner_team_id
