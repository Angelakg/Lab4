.mode csv Car_Score
.import Data/data.csv Car_Score

CREATE TABLE New_Car_Score(
Car_ID TEXT PRIMARY KEY
Racer_Turbo TEXT,
Racer_Supercharged TEXT,
Racer_Performance TEXT,
Racer_Horsepower TEXT,
Car_Overall TEXT,
Engine_Modifications TEXT,
Engine_Performance TEXT,
Engine_Chrome TEXT,
Engine_Detailing TEXT,
Engine_Cleanliness TEXT,
Body_Frame_Undercarriage TEXT,
Body_Frame_Suspension TEXT,
Body_Frame_Chrome TEXT,
Body_Frame_Detailing TEXT,
Body_Frame_Cleanliness TEXT,
Mods_Paint TEXT,
Mods_Body TEXT,
Mods_Wrap TEXT,
Mods_Rims TEXT,
Mods_Interior TEXT, 
Mods_Other TEXT,
Mods_ICE TEXT,
Mods_Aftermarket TEXT,
Mods_WIP TEXT,
Mods_Overall TEXT
);

INSERT INTO New_Car_Score
SELECT Car_ID, Racer_Turbo, Racer_Supercharged, Racer_Performance, Racer_Horsepower, Car_Overall, Engine_Modifications, Engine_Performance, Engine_Chrome, Engine_Detailing, Engine_Cleanliness, Body_Frame_Undercarriage, Body_Frame_Suspension, Body_Frame_Chrome, Body_Frame_Detailing, Body_Frame_Cleanliness, Mods_Paint, Mods_Body, Mods_Wrap, Mods_Rims, Mods_Interior, Mods_Other, Mods_ICE, Mods_Aftermarket, Mods_WIP, Mods_Overall FROM Car_Score;  


ALTER TABLE New_Car_Score
ADD COLUMN Total

UPDATE New_Car_Score SET Total = Racer_Turbo + Racer_Supercharged + Racer_Performance + Racer_Horsepower + Car_Overall + Engine_Modifications + Engine_Performance + Engine_Chrome + Engine_Detailing + Engine_Cleanliness + Body_Frame_Undercarriage + Body_Frame_Suspension + Body_Frame_Chrome + Body_Frame_Detailing + Body_Frame_Cleanliness + Mods_Paint + Mods_Body + Mods_Wrap + Mods_Rims + Mods_Interior + Mods_Other + Mods_ICE + Mods_Aftermarket + Mods_WIP + Mods_Overall;


CREATE TABLE Table(
CAR_ID TEXT PRIMARY KEY,
Year TEXT,
Make TEXT,
Model TEXT,
Total TEXT
);

INSERT INTO Table
SELECT Cars.Car_ID, Cars.Year, Cars.Make, Cars.Model, New_Car_Score.Total
FROM Cars

DROP TABLE New_Car_Score;



