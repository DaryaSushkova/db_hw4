CREATE DATABASE trains;
GRANT ALL PRIVILEGES ON DATABASE trains TO sushkova_204;
\connect trains

CREATE TABLE "public.Train" (
	"TrainNr" serial(1000) NOT NULL,
	"Length" int(100) NOT NULL,
	"StartStat" varchar(10) NOT NULL,
	"EndStat" varchar(10) NOT NULL,
	CONSTRAINT "Train_pk" PRIMARY KEY ("TrainNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Station" (
	"Name" varchar(10) NOT NULL,
	"Tracks" int(100) NOT NULL,
	CONSTRAINT "Station_pk" PRIMARY KEY ("Name")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Connected" (
	"TrainNr" serial(1000) NOT NULL,
	"StatName" varchar(10) NOT NULL,
	"Arrival" DATE NOT NULL,
	"Departure" DATE NOT NULL,
	CONSTRAINT "Connected_pk" PRIMARY KEY ("TrainNr","StatName")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.City" (
	"Region" varchar(10) NOT NULL,
	"Name" varchar(10) NOT NULL,
	CONSTRAINT "City_pk" PRIMARY KEY ("Region","Name")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Lie_in" (
	"StatName" varchar(10) NOT NULL,
	"Region" varchar(10) NOT NULL,
	"CityName" varchar(10) NOT NULL,
	CONSTRAINT "Lie_in_pk" PRIMARY KEY ("StatName")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Train" ADD CONSTRAINT "Train_fk0" FOREIGN KEY ("StartStat") REFERENCES "Station"("Name");
ALTER TABLE "Train" ADD CONSTRAINT "Train_fk1" FOREIGN KEY ("EndStat") REFERENCES "Station"("Name");


ALTER TABLE "Connected" ADD CONSTRAINT "Connected_fk0" FOREIGN KEY ("TrainNr") REFERENCES "Train"("TrainNr");
ALTER TABLE "Connected" ADD CONSTRAINT "Connected_fk1" FOREIGN KEY ("StatName") REFERENCES "Station"("Name");


ALTER TABLE "Lie_in" ADD CONSTRAINT "Lie_in_fk0" FOREIGN KEY ("StatName") REFERENCES "Station"("Name");
ALTER TABLE "Lie_in" ADD CONSTRAINT "Lie_in_fk1" FOREIGN KEY ("Region") REFERENCES "City"("Region");
ALTER TABLE "Lie_in" ADD CONSTRAINT "Lie_in_fk2" FOREIGN KEY ("CityName") REFERENCES "City"("Name");






