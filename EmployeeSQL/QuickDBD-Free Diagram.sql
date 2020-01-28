-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Iy20ss
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "emp_dept_map" (
    "ID"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_emp_dept_map" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "dept_manager" (
    "ID"  SERIAL  NOT NULL,
    "dept_no" varchar   NOT NULL,
    "manager_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "emp_title" (
    "ID"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_emp_title" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "emp_salary" (
    "ID"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_emp_salary" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "emp_dept_map" ADD CONSTRAINT "fk_emp_dept_map_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "emp_dept_map" ADD CONSTRAINT "fk_emp_dept_map_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_manager_no" FOREIGN KEY("manager_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "emp_title" ADD CONSTRAINT "fk_emp_title_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "emp_salary" ADD CONSTRAINT "fk_emp_salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

CREATE INDEX "idx_department_dept_name"
ON "department" ("dept_name");

CREATE INDEX "idx_employee_first_name"
ON "employee" ("first_name");

CREATE INDEX "idx_employee_last_name"
ON "employee" ("last_name");

CREATE INDEX "idx_emp_dept_map_emp_no"
ON "emp_dept_map" ("emp_no");

CREATE INDEX "idx_emp_dept_map_dept_no"
ON "emp_dept_map" ("dept_no");

CREATE INDEX "idx_dept_manager_dept_no"
ON "dept_manager" ("dept_no");

CREATE INDEX "idx_dept_manager_manager_no"
ON "dept_manager" ("manager_no");

CREATE INDEX "idx_emp_title_emp_no"
ON "emp_title" ("emp_no");

CREATE INDEX "idx_emp_salary_emp_no"
ON "emp_salary" ("emp_no");

