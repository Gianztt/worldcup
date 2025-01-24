#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#First Querys
: <<'COMENTARIO'
CREATE DATABASE worldcup;
\c worldcup;
CREATE TABLE teams();
CREATE TABLE games();
ALTER TABLE teams ADD COLUMN team_id SERIAL PRIMARY KEY, ADD COLUMN name VARCHAR(50) UNIQUE;
ALTER TABLE games ADD COLUMN game_id SERIAL PRIMARY KEY, ADD COLUMN year INT NOT NULL, ADD COLUMN round VARCHAR(50) NOT NULL;
ALTER TABLE games ADD COLUMN winner_id INT NOT NULL, ADD COLUMN opponent_id INT NOT NULL;
ALTER TABLE games ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id), ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id);
ALTER TABLE games ADD COLUMN winner_goals INT NOT NULL, ADD COLUMN opponent_goals INT NOT NULL;
ALTER TABLE teams ALTER COLUMN name SET NOT NULL;
chmod +x insert_data.sh
chmod +x queries.sh

COMENTARIO


#Inserting Teams into Table Teams
#Adding winner teams that not exist
echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Filter first line
  if [[ $WINNER != "winner" ]]
  #Filter if team already exist
  then 
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
  #Insert team that don't exist
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $WINNER
      fi
    fi
  fi
#Adding opponent teams that not exist
   #Filter first line
  if [[ $OPPONENT != "opponent" ]]
  #Filter if team already exist
  then 
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
  #Insert team that don't exist
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi
done

# Inserting year round ids goals 
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
# Como lo hacemos con las ids y los goals?, el problema esta en que ya tenemos ciertos ids para ciertos equipos
#Y esos equipos estan asociados a winners goals, opponent goals y a una id de team, yo creo que con una igualdasd
do
#Filter first line
  if [[ $YEAR != "year" ]]
  then 
  #Search winner_id and opponent_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #Insert data
  INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  fi
done
