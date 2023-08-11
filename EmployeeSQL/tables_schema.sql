-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS titles;


-- MODIFIED from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles" (
    "title_id" VARCHAR(5) NOT NULL PRIMARY KEY,
    "title" VARCHAR(255) NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL PRIMARY KEY,
    "emp_title_id" VARCHAR(5) NOT NULL,
    "birth_date" VARCHAR(10) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" VARCHAR(10) NOT NULL,
	FOREIGN KEY ("emp_title_id") REFERENCES "titles"("title_id")
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL PRIMARY KEY,
    "salary" INT NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no")
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(255) NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
	Primary KEY ("emp_no", "dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES "departments"("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" INT NOT NULL,
	Primary KEY ("emp_no", "dept_no"),
	FOREIGN KEY ("dept_no") REFERENCES "departments"("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no")
);