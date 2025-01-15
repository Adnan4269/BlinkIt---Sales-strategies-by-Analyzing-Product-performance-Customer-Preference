create database sky_sports;
use sky_sports;
show tables;

select * from skysports;

#1. UNIQUE team names
select distinct(team)
from skysports;

#3.	 count of all team
select count(team) 
from skysports;

#4. matches_played by each team
select team, matches_played 
from skysports;

#5. team, percent of wins with respect to matches_played by each team and name the resulting column as wins_percent
select team, 100.0*(wins/matches_played) as wins_percent 
from skysports;

#6.	 which team has maximum goals_scored and how much
SELECT team, goals_scored 
FROM skysports
WHERE goals_scored = (SELECT MAX(goals_scored) FROM skysports);

#7.	 percent of draws with respect to matches_played round of to 2 digits by each team
select team, round(100.0*(draws/matches_played), 2) 
from skysports;

#8.	 which team has minimum goals_scored and how much
SELECT team, goals_scored 
FROM skysports 
WHERE goals_scored = (SELECT min(goals_scored) FROM skysports);

#9.	 percent of losses with respect to matches_played by each team in ascending order by losses and name the resulting column as losses_percent
select team, 100.0*(losses/matches_played) as losses_percent 
from skysports 
order by losses_percent;

#10.  the average goal_difference
select avg(goal_difference) 
from skysports;

#11.  name of the team where points are 0
select team, points 
from skysports 
where points=0;

#12.  all data where expected_goal_scored is less than exp_goal_conceded
select * 
from skysports 
where expected_goal_scored < exp_goal_conceded;

#13.  data where exp_goal_difference is in between -0.5 and 0.5
select * 
from skysports 
where exp_goal_difference between -0.5 and 0.5;

#14.  all data in ascending order by exp_goal_difference_per_90 
select * 
from skysports 
order by exp_goal_difference_per_90 asc;

#15.  team which has maximum number of players_used
select team, players_used 
from skysports 
where players_used = (SELECT max(players_used) FROM skysports);

#16.  each team name and avg_age in ascending order by avg_age
select team, avg_age 
from skysports 
order by avg_age;

#17.  average possession of teams
select avg(possession) 
from skysports;

#18.  team which has played atleast 5 games
select team, games 
from skysports 
where games>=5;

#19.  all data for which minutes is greater than 600
select * 
from skysports 
where minutes>600;

#20.  team, goals, assists in ascending order by goals
select team, goals, assists 
from skysports 
order by goals;

#21.  team, pens_made, pens_att in descending order by pens_made
select team, pens_made, pens_att 
from skysports 
order by pens_made desc;

#22.  team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow
select team, cards_yellow, cards_red 
from skysports 
where cards_red=1 
order by cards_yellow;

#23.  team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90
select team, goals_per90, assists_per90, goals_assists_per90 
from skysports 
order by goals_assists_per90 desc;

#24.  team, goals_pens_per90, goals_assists_pens_per90 in ascending order by goals_assists_pens_per90
select team, goals_pens_per90, goals_assists_pens_per90 
from skysports 
order by goals_assists_pens_per90;

#25.  team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct
select  team, shots, shots_on_target, shots_on_target_pct 
from skysports 
where shots_on_target_pct<30 
order by shots_on_target_pct;

#26.  team, shots_per90, shots_on_target_per90 for team Belgium
select team, shots_per90, shots_on_target_per90 
from skysports 
where team='Belgium';

#27.  team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance
select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance 
from skysports 
order by average_shot_distance desc;

#28.  team, errors, touches for which errors is 0 and touches is less than 1500
select team, errors, touches  
from skysports 
where errors=0 and touches<1500;

#29.  team, fouls which has maximum number of fouls
select team, max(fouls) 
from skysports;
#or
select team, fouls 
from skysports 
where fouls=(select max(fouls) from skysports);

#30.  team, offisdes which has offsides less than 10 or greater than 20
select team, offsides 
from skysports 
where offsides<10 or offsides>20;

#31.  team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct
select team, aerials_won, aerials_lost, aerials_won_pct 
from skysports 
order by aerials_won_pct desc;

# group by
#32.  number of teams each group has
select `group`, count(team) 
from skysports 
group by `group`;

#33.  team names group 6 has
select team, `group` 
from skysports 
where `group`=6;

#34.  Australia belongs to which group
select team, `group` 
from skysports
where team='Australia';

#35.  group, average wins by each group
select `group`, avg(wins) 
from skysports 
group by `group`;

#36.  group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored  
select gs.`group`, max(gs.expected_goal_scored) as max_exp_goal_scored 
from skysports gs 
group by gs.`group` 
order by max_exp_goal_scored;

#37.  group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded
select gs.`group`, min(gs.exp_goal_conceded) as min_exp_goal_conceded 
from skysports gs 
group by gs.`group` 
order by min_exp_goal_conceded desc;

#38.  group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90
select gs.`group`, avg(gs.exp_goal_difference_per_90) as avg_exp_goal_diff_per_90 
from skysports gs 
group by gs.`group` 
order by avg_exp_goal_diff_per_90;

#39.  which team has equal number of goals_scored and goals_against
select team, goals_scored, goals_against 
from skysports 
where goals_scored = goals_against;

#40.  which team has maximum players_used
select team, players_used 
from skysports 
where players_used=(select max(players_used) from skysports);

#41.  team, players_used, avg_age, games, minutes  where minutes less than 500 and greater than 200
select team, players_used, avg_age, games, minutes 
from skysports 
where minutes < 500 and minutes > 200;

#42.  all data of skysports in ascending order BY points
select * 
from skysports 
order by points;

#43.  ALL UNIQUE team in ascending order by team
select * 
from skysports2;

#SQL Joins
#44.  average avg_age of each group and arrange it in descending order by avg_age.
select td.`group`, avg(gs.avg_age) as avg_group_age
from skysports2 td inner join skysports gs 
on td.team=gs.team
group by td.`group` 
order by avg_group_age desc;

#45.  sum of fouls for each group and arrange it in ascending order by fouls.
select td.`group`, sum(gs.fouls) as sum_fouls 
from skysports2 td inner join skysports gs 
on td.team=gs.team
group by td.`group` 
order by sum_fouls;


#46.  total number of games for each group and arrange it in descending order by games.
select td.`group`, sum(gs.games) as sum_games 
from skysports2 td inner join skysports gs 
on td.team=gs.team
group by td.`group` 
order by sum_games desc;

#47.  total number of players_used for each group and arrange it in ascending order by players_used.
select td.`group`, sum(gs.players_used) as sum_players_used 
from skysports2 td inner join skysports gs
on td.team=gs.team
group by td.`group` 
order by sum_players_used;

#48.  total number of offsides for each group and arrange it in ascending order by offsides.
select td.`group`, sum(gs.offsides) as sum_offsides 
from skysports2 td inner join skysports gs 
on td.team=gs.team
group by td.`group` 
order by sum_offsides;

#49.  average passes_pct for each group and arrange it in descending order by passes_pct.
select td.`group`, avg(gs.passes_pct) as avg_passes_pct
from skysports2 td inner join skysports gs 
on td.team=gs.team
group by td.`group` 
order by avg_passes_pct desc;

#50.  average goals_per90 for each group and arrange it in ascending order by goals_per90.
select td.`group`, avg(gs.goals_per90) as avg_goals_per90
from skysports2 td inner join skysports gs 
on td.team=gs.team
group by td.`group` 
order by avg_goals_per90;
