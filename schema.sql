CREATE TABLE "public"."User" (
  uuid VARCHAR(255) PRIMARY KEY NOT NULL,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  isAdmin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "public"."Cohort" (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "public"."Course" (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) UNIQUE NOT NULL,
  cohortId INTEGER NOT NULL,
  FOREIGN KEY (cohortId) REFERENCES "public"."Cohort"(id),
  UNIQUE (name, cohortId)
);

CREATE TABLE "public"."Workspace" (
  uuid VARCHAR(255) PRIMARY KEY NOT NULL,
  desiredCount INTEGER NOT NULL,
  userId VARCHAR(255) NOT NULL,
  courseId INTEGER NOT NULL,
  FOREIGN KEY (courseId) REFERENCES "public"."Course"(id) ON DELETE CASCADE,
  FOREIGN KEY (userId) REFERENCES "public"."User"(uuid) ON DELETE CASCADE
);

CREATE TABLE "public"."User_Cohort" (
  userId VARCHAR(255) NOT NULL,
  cohortId INTEGER NOT NULL,
  FOREIGN KEY (userId) REFERENCES "public"."User"(uuid) ON DELETE CASCADE,
  FOREIGN KEY (cohortId) REFERENCES "public"."Cohort"(id) ON DELETE CASCADE,
  PRIMARY KEY (userId, cohortId)
);

CREATE TABLE "public"."User_Course" (
  userId VARCHAR(255) NOT NULL,
  courseId INTEGER NOT NULL,
  FOREIGN KEY (userId) REFERENCES "public"."User"(uuid) ON DELETE CASCADE,
  FOREIGN KEY (courseId) REFERENCES "public"."Course"(id) ON DELETE CASCADE,
  PRIMARY KEY (userId, courseId)
);


-- TODO; Insert Admin User into Database
