-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Titles" (
    "Title_id" VARCHAR   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_id"
     )
);

CREATE TABLE "Employees" (
    "Emp_no" INTEGER   NOT NULL,
    "Emp_title" VARCHAR   NOT NULL,
    "Birth_date" DATE   NOT NULL,
    "First_name" VARCHAR   NOT NULL,
    "Last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "Hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Departments" (
    "Dept_no" VARCHAR   NOT NULL,
    "Dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_manager" (
    "Dept_no" VARCHAR   NOT NULL,
    "Emp_no" INTEGER   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "Emp_no" INTEGER   NOT NULL,
    "Dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "Emp_no" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_title" FOREIGN KEY("Emp_title")
REFERENCES "Titles" ("Title_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

CREATE INDEX "idx_Titles_Title"
ON "Titles" ("Title");

CREATE INDEX "idx_Salaries_Salary"
ON "Salaries" ("Salary");

