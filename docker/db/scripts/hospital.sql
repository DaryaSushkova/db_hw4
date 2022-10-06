CREATE DATABASE hospital;
GRANT ALL PRIVILEGES ON DATABASE hospital TO sushkova_204;
\connect hospital

CREATE TABLE "public.StationPersonell" (
	"PersNr" serial(1000) NOT NULL,
	"Name" varchar(15) NOT NULL,
	CONSTRAINT "StationPersonell_pk" PRIMARY KEY ("PersNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Caregiver" (
	"PersNr" serial(1000) NOT NULL,
	"Qualification" varchar(20) NOT NULL,
	CONSTRAINT "Caregiver_pk" PRIMARY KEY ("PersNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Doctor" (
	"PersNr" serial(1000) NOT NULL,
	"Area" varchar(20) NOT NULL,
	"Rank" varchar(20) NOT NULL,
	CONSTRAINT "Doctor_pk" PRIMARY KEY ("PersNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Patient" (
	"PatientNr" serial(1000) NOT NULL,
	"Name" varchar(15) NOT NULL,
	"Disease" varchar(15) NOT NULL,
	CONSTRAINT "Patient_pk" PRIMARY KEY ("PatientNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Treats" (
	"PatientNr" serial(1000) NOT NULL,
	"DoctorNr" serial(1000) NOT NULL,
	CONSTRAINT "Treats_pk" PRIMARY KEY ("PatientNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Station" (
	"StatNr" serial(1000) NOT NULL,
	"Name" varchar(15) NOT NULL,
	CONSTRAINT "Station_pk" PRIMARY KEY ("StatNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Room" (
	"StatNr" serial(1000) NOT NULL,
	"RoomNr" serial(1000) NOT NULL,
	"Beds" int(6) NOT NULL,
	CONSTRAINT "Room_pk" PRIMARY KEY ("StatNr","RoomNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Works_for" (
	"PersNr" serial(1000) NOT NULL,
	"StatNr" serial(1000) NOT NULL,
	CONSTRAINT "Works_for_pk" PRIMARY KEY ("PersNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Admission" (
	"PatientNr" serial(1000) NOT NULL,
	"StatNr" serial(1000) NOT NULL,
	"RoomNr" serial(1000) NOT NULL,
	"from" DATE NOT NULL,
	"to" DATE NOT NULL,
	CONSTRAINT "Admission_pk" PRIMARY KEY ("PatientNr")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Caregiver" ADD CONSTRAINT "Caregiver_fk0" FOREIGN KEY ("PersNr") REFERENCES "StationPersonell"("PersNr");

ALTER TABLE "Doctor" ADD CONSTRAINT "Doctor_fk0" FOREIGN KEY ("PersNr") REFERENCES "StationPersonell"("PersNr");


ALTER TABLE "Treats" ADD CONSTRAINT "Treats_fk0" FOREIGN KEY ("PatientNr") REFERENCES "Patient"("PatientNr");
ALTER TABLE "Treats" ADD CONSTRAINT "Treats_fk1" FOREIGN KEY ("DoctorNr") REFERENCES "Doctor"("PersNr");


ALTER TABLE "Room" ADD CONSTRAINT "Room_fk0" FOREIGN KEY ("StatNr") REFERENCES "Station"("StatNr");

ALTER TABLE "Works_for" ADD CONSTRAINT "Works_for_fk0" FOREIGN KEY ("PersNr") REFERENCES "StationPersonell"("PersNr");
ALTER TABLE "Works_for" ADD CONSTRAINT "Works_for_fk1" FOREIGN KEY ("StatNr") REFERENCES "Station"("StatNr");

ALTER TABLE "Admission" ADD CONSTRAINT "Admission_fk0" FOREIGN KEY ("PatientNr") REFERENCES "Patient"("PatientNr");
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_fk1" FOREIGN KEY ("StatNr") REFERENCES "Room"("StatNr");
ALTER TABLE "Admission" ADD CONSTRAINT "Admission_fk2" FOREIGN KEY ("RoomNr") REFERENCES "Room"("RoomNr");










