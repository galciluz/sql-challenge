-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_id" INTEGER   NOT NULL,
    "emp_titleid" VARCHAR(5)   NOT NULL,
    "birthdate" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "title" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salary" (
    "emp_id" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "department" (
    "dept_id" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_id" VARCHAR(4)   NOT NULL,
    "emp_id" INTEGER   NOT NULL,
    "(dept_id" emp_no)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "(dept_id"
     )
);

CREATE TABLE "dept_employee" (
    "emp_id" INTEGER   NOT NULL,
    "dept_id" VARCHAR(4)   NOT NULL,
    "(dept_id" emp_no)   NOT NULL,
    CONSTRAINT "pk_dept_employee" PRIMARY KEY (
        "(dept_id"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_titleid" FOREIGN KEY("emp_titleid")
REFERENCES "title" ("title_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

