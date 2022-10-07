CREATE TABLE "StationPersonell" (
  "PersNr" int PRIMARY KEY,
  "Name" varchar
);



CREATE TABLE "Caregiver" (
  "PersNr" int PRIMARY KEY,
  "Qualification" varchar
);



CREATE TABLE "Doctor" (
  "PersNr" int PRIMARY KEY,
  "Rank" int
);



CREATE TABLE "Patient" (
  "PatientNr" int PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar
);



CREATE TABLE "Treats" (
  "PersNr" int,
  "PatientNr" int
);



CREATE TABLE "Station" (
  "StatNr" int PRIMARY KEY,
  "Name" varchar
);



CREATE TABLE "Room" (
  "RoomNr" int PRIMARY KEY,
  "Beds" int
);



CREATE TABLE "Work_for" (
  "StatNr" int,
  "PersNr" int
);



CREATE TABLE "Room_in_Stat" (
  "StatNr" int,
  "RoomNr" int
);



CREATE TABLE "Admission" (
  "RoomNr" int,
  "PatientNr" int,
  "from" DATE,
  "to" DATE
);



ALTER TABLE "Caregiver" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("PersNr");
ALTER TABLE "Doctor" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "Work_for" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");
ALTER TABLE "Work_for" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "Treats" ADD FOREIGN KEY ("PersNr") REFERENCES "Doctor" ("PersNr");
ALTER TABLE "Treats" ADD FOREIGN KEY ("PatientNr") REFERENCES "Patient" ("PatientNr");

ALTER TABLE "Room_in_Stat" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");
ALTER TABLE "Room_in_Stat" ADD FOREIGN KEY ("RoomNr") REFERENCES "Room" ("RoomNr");

ALTER TABLE "Admission" ADD FOREIGN KEY ("RoomNr") REFERENCES "Room" ("RoomNr");
ALTER TABLE "Admission" ADD FOREIGN KEY ("PatientNr") REFERENCES "Patient" ("PatientNr");