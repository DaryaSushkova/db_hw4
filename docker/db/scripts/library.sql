CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO sushkova_204;
\connect library

CREATE TABLE "public.Publisher" (
	"PublNr" serial(1000) NOT NULL,
	"Name" varchar(10) NOT NULL,
	"Address" varchar(10) NOT NULL,
	CONSTRAINT "Publisher_pk" PRIMARY KEY ("PublNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Book" (
	"ISBN" serial(1000) NOT NULL,
	"Year" DATE NOT NULL,
	"Name" varchar(10) NOT NULL,
	"Author" varchar(10) NOT NULL,
	"Pages" int(500) NOT NULL,
	CONSTRAINT "Book_pk" PRIMARY KEY ("ISBN")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Copy" (
	"ISBN" serial(1000) NOT NULL,
	"CopyNr" serial(1000) NOT NULL,
	"Position" varchar(10) NOT NULL,
	CONSTRAINT "Copy_pk" PRIMARY KEY ("ISBN","CopyNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Reader" (
	"ReadNr" serial(1000) NOT NULL,
	"Surname" varchar(10) NOT NULL,
	"Name" varchar(10) NOT NULL,
	"Address" varchar(10) NOT NULL,
	"Birth" DATE NOT NULL,
	CONSTRAINT "Reader_pk" PRIMARY KEY ("ReadNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Rent" (
	"ReadNr" serial(1000) NOT NULL,
	"ISBN" serial(1000) NOT NULL,
	"CopyNr" serial(1000) NOT NULL,
	"Return" DATE NOT NULL,
	CONSTRAINT "Rent_pk" PRIMARY KEY ("ReadNr","ISBN","CopyNr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Publish" (
	"ISBN" serial(1000) NOT NULL,
	"PublNr" serial(1000) NOT NULL,
	CONSTRAINT "Publish_pk" PRIMARY KEY ("ISBN")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Category" (
	"Name" varchar(10) NOT NULL,
	CONSTRAINT "Category_pk" PRIMARY KEY ("Name")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Assign" (
	"ISBN" serial(1000) NOT NULL,
	"CategName" varchar(10) NOT NULL,
	CONSTRAINT "Assign_pk" PRIMARY KEY ("ISBN","CategName")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "Copy" ADD CONSTRAINT "Copy_fk0" FOREIGN KEY ("ISBN") REFERENCES "Book"("ISBN");


ALTER TABLE "Rent" ADD CONSTRAINT "Rent_fk0" FOREIGN KEY ("ReadNr") REFERENCES "Reader"("ReadNr");
ALTER TABLE "Rent" ADD CONSTRAINT "Rent_fk1" FOREIGN KEY ("ISBN") REFERENCES "Copy"("ISBN");
ALTER TABLE "Rent" ADD CONSTRAINT "Rent_fk2" FOREIGN KEY ("CopyNr") REFERENCES "Copy"("CopyNr");

ALTER TABLE "Publish" ADD CONSTRAINT "Publish_fk0" FOREIGN KEY ("ISBN") REFERENCES "Book"("ISBN");
ALTER TABLE "Publish" ADD CONSTRAINT "Publish_fk1" FOREIGN KEY ("PublNr") REFERENCES "Publisher"("PublNr");


ALTER TABLE "Assign" ADD CONSTRAINT "Assign_fk0" FOREIGN KEY ("ISBN") REFERENCES "Book"("ISBN");
ALTER TABLE "Assign" ADD CONSTRAINT "Assign_fk1" FOREIGN KEY ("CategName") REFERENCES "Category"("Name");









