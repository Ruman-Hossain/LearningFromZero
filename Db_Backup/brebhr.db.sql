BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "department" (
	"Dept_id"	INTEGER,
	"Dept_name"	TEXT,
	"Dept_Location"	TEXT
);
CREATE TABLE IF NOT EXISTS "employee" (
	"Emp_id"	INTEGER,
	"Emp_name"	TEXT,
	"Job_name"	TEXT,
	"Manager_id"	TEXT,
	"Hire_date"	TEXT,
	"salary"	REAL,
	"Commission"	TEXT,
	"Dept_id"	INTEGER
);
CREATE TABLE IF NOT EXISTS "salary_grade" (
	"grade"	INTEGER,
	"min_sal"	INTEGER,
	"max_sal"	INTEGER
);
INSERT INTO "department" ("Dept_id","Dept_name","Dept_Location") VALUES (1001,'Finance','Sydney'),
 (2001,'Audit','Melbourne'),
 (3001,'Marketing','Perth'),
 (4001,'Production','Brisbane');
INSERT INTO "employee" ("Emp_id","Emp_name","Job_name","Manager_id","Hire_date","salary","Commission","Dept_id") VALUES (68319,'Kayling','President',NULL,'1991-11-18',6000.0,NULL,1001),
 (66928,'Blaze','Manager','68319','1991-05-01',2750.0,NULL,300),
 (67832,'Clare','Manager','68319','1991-06-09',2550.0,NULL,1001),
 (65646,'Jonas','Manager','68319','1991-04-02',2957.0,NULL,2001),
 (67858,'Scarlet','Analyst','65646','1991-04-19',3100.0,NULL,2001),
 (69062,'Frank','Analyst','65646','1991-12-03',3100.0,NULL,2001),
 (63679,'Sandrine','Clerk','69062','1991-12-18',3100.0,NULL,2001),
 (64989,'Adelyn','salesman','66928','1991-02-20',1700.0,'400.0',3001),
 (65271,'wade','Salesman','66928','1991-02-22',1350.0,'600.0',3001);
INSERT INTO "salary_grade" ("grade","min_sal","max_sal") VALUES (1,800,1300),
 (2,1301,1500),
 (3,1501,2100),
 (4,2101,3100);
COMMIT;
