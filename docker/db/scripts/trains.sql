CREATE TABLE "Train" (
  "TrainNr" int PRIMARY KEY,
  "Length" int
);



CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "Tracks" int
);



CREATE TABLE "City" (
  "CityName" varchar,
  "Region" varchar,
  
  PRIMARY KEY("CityName", "Region")
);



CREATE TABLE "Connected" (
  "TrainNr" int,
  "StatName" varchar,
  "Departure" DATE,
  "Arrival" DATE
);



CREATE TABLE "BoundaryStat" (
  "TrainNr" int,
  "StartStat" varchar,
  "EndStat" varchar
);



CREATE TABLE "Lie_in" (
  "StatName" varchar,
  "CityName" varchar,
  "Region" varchar
);



ALTER TABLE "Connected" ADD FOREIGN KEY ("TrainNr") REFERENCES "Train" ("TrainNr");
ALTER TABLE "Connected" ADD FOREIGN KEY ("StatName") REFERENCES "Station" ("Name");

ALTER TABLE "BoundaryStat" ADD FOREIGN KEY ("TrainNr") REFERENCES "Train" ("TrainNr");
ALTER TABLE "BoundaryStat" ADD FOREIGN KEY ("StartStat") REFERENCES "Station" ("Name");
ALTER TABLE "BoundaryStat" ADD FOREIGN KEY ("EndStat") REFERENCES "Station" ("Name");

ALTER TABLE "Lie_in" ADD FOREIGN KEY ("StatName") REFERENCES "Station" ("Name");
ALTER TABLE "Lie_in" ADD FOREIGN KEY ("CityName", "Region") REFERENCES "City" ("CityName", "Region");