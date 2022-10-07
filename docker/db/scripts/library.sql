CREATE TABLE "Publisher" (
  "PublNr" int PRIMARY KEY,
  "Name" varchar,
  "Address" varchar
);



CREATE TABLE "Book" (
  "ISBN" int PRIMARY KEY,
  "Name" varchar,
  "Year" DATE,
  "Author" varchar,
  "Pages" int
);



CREATE TABLE "Copy" (
  "ISBN" int,
  "CopyNr" int,
  "Position" int,
  PRIMARY KEY ("ISBN", "CopyNr")
);



CREATE TABLE "Category" (
  "CatNr" int PRIMARY KEY,
  "Name" varchar
);



CREATE TABLE "Reader" (
  "ReadNr" int PRIMARY KEY,
  "Surname" varchar,
  "Name" varchar,
  "Address" varchar,
  "Birth" DATE
);



CREATE TABLE "Publish" (
  "ISBN" int,
  "PublNr" int
);



CREATE TABLE "Get_category" (
  "ISBN" int,
  "CatNr" int
);



CREATE TABLE "Rent" (
  "ReadNr" int,
  "ISBN" int,
  "CopyNr" int,
  "Return" DATE
);



ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Publish" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");
ALTER TABLE "Publish" ADD FOREIGN KEY ("PublNr") REFERENCES "Publisher" ("PublNr");

ALTER TABLE "Get_category" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");
ALTER TABLE "Get_category" ADD FOREIGN KEY ("CatNr") REFERENCES "Category" ("CatNr");

ALTER TABLE "Rent" ADD FOREIGN KEY ("ReadNr") REFERENCES "Reader" ("ReadNr");
ALTER TABLE "Rent" ADD FOREIGN KEY ("ISBN", "CopyNr") REFERENCES "Copy" ("ISBN", "CopyNr");