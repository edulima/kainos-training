CREATE DATABASE BUTZ;

USE BUTZ;

drop table IF EXISTS Employee, SalesEmployee, BillableEmployee, Projects, ProjectEmployee;
 
CREATE TABLE Employee (
  emp_id int primary key auto_increment,
  dob date not null,
  f_name varchar(20) not null,
  l_name varchar(20) not null,
  title varchar(10) not null,
  picture varchar(100) default '',
  salary decimal(10,2) not null,
  emp_type ENUM('employee_sales', 'employee_billable', 'employee')
  not null
  default 'employee'
);


CREATE TABLE SalesEmployee (
  semp_id int primary key auto_increment,
  emp_id int,
  commission decimal(5,2) not null,
  revenue decimal(10,2) not null,
  FOREIGN KEY (emp_id) references Employee(emp_id)
);


CREATE TABLE BillableEmployee (
  bemp_id int primary key auto_increment,
  emp_id int,
  day_rate decimal(8,2) not null,
  cv varchar(100) not null,
  FOREIGN KEY (emp_id) references Employee(emp_id)
);


CREATE TABLE Projects (
  p_id int primary key auto_increment,
  start_date date,
  end_date date,
  project_name varchar(50) not null
);


CREATE TABLE ProjectEmployee (
  p_id int,
  emp_id int,
  FOREIGN KEY (p_id) references Projects(p_id),
  FOREIGN KEY (emp_id) references Employee(emp_id)
);

INSERT INTO Projects (start_date, end_date, project_name) VALUES ('2015-07-17', '2016-07-17', 'Gov DEFRA');
INSERT INTO Projects (start_date, end_date, project_name) VALUES ('2014-10-30', '2016-10-30', 'Gov DVLA');
INSERT INTO Projects (start_date, end_date, project_name) VALUES ('2015-02-20', '2016-02-20', 'Gov FCO');

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-13', 'Mallory', 'Marsh', 'mr', '../photos/Mallory_Marsh.jpg', 23500.55, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (1, 48.5, 29230.84);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 1);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1964-12-13', 'Grant', 'Bates', 'mrs', '../photos/Grant_Bates.jpg', 29500.17, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (2, 80.82, '../cv/Grant_Bates.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 2);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-05', 'Isabelle', 'Porter', 'miss', '../photos/Isabelle_Porter.jpg', 32600.69, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 3);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-03-20', 'Mannix', 'Shields', 'master', '../photos/Mannix_Shields.jpg', 61900.17, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (4, 100.5, 262.040);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 4);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-02-28', 'Maisie', 'Farley', 'dr', '../photos/Maisie_Farley.jpg', 96200.97, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (5, 263.56, '../cv/Maisie_Farley.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 5);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-09-11', 'Pamela', 'Warren', 'mr', '../photos/Pamela_Warren.jpg', 47900.72, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 6);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-04-20', 'Aurora', 'Harris', 'mrs', '../photos/Aurora_Harris.jpg', 14000.89, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (7, 66.5, 28190.47);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 7);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-24', 'Frances', 'Cooper', 'miss', '../photos/Frances_Cooper.jpg', 09700.17, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (8, 26.58, '../cv/Frances_Cooper.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 8);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-10-02', 'Wanda', 'Mcdowell', 'master', '../photos/Wanda_Mcdowell.jpg', 79500.96, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 9);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-11', 'Yeo', 'Huber', 'dr', '../photos/Yeo_Huber.jpg', 39300.48, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (10, 21.5, 26410.89);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 10);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-07-04', 'Raya', 'Fox', 'mr', '../photos/Raya_Fox.jpg', 60600.67, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (11, 166.03, '../cv/Raya_Fox.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 11);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-08-29', 'Silas', 'Freeman', 'mrs', '../photos/Silas_Freeman.jpg', 28400.44, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 12);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-27', 'Yasir', 'Orr', 'miss', '../photos/Yasir_Orr.jpg', 43800.97, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (13, 19.5, 24930.19);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 13);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-05-15', 'Jolene', 'Diaz', 'master', '../photos/Jolene_Diaz.jpg', 37900.32, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (14, 103.84, '../cv/Jolene_Diaz.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 14);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-09-18', 'Rama', 'Fletcher', 'dr', '../photos/Rama_Fletcher.jpg', 25400.90, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 15);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-04-25', 'Imelda', 'Key', 'mr', '../photos/Imelda_Key.jpg', 39600.20, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (16, 53.5, 29310.66);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 16);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-03-20', 'Kai', 'Luna', 'mrs', '../photos/Kai_Luna.jpg', 29800.08, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (17, 81.64, '../cv/Kai_Luna.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 17);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-11-07', 'Wynter', 'Graves', 'miss', '../photos/Wynter_Graves.jpg', 99900.35, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 18);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-08-18', 'Zena', 'Duran', 'master', '../photos/Zena_Duran.jpg', 24900.45, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (19, 21.5, 28220.71);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 19);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-05', 'Vera', 'Melton', 'dr', '../photos/Vera_Melton.jpg', 14900.28, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (20, 40.82, '../cv/Vera_Melton.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 20);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-05-25', 'Hayes', 'Marsh', 'mr', '../photos/Hayes_Marsh.jpg', 62800.20, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 21);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1964-10-22', 'Ashton', 'Mccullough', 'mrs', '../photos/Ashton_Mccullough.jpg', 98100.65, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (22, 81.5, 29940.19);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 22);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-06-05', 'Brennan', 'Newton', 'miss', '../photos/Brennan_Newton.jpg', 35500.61, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (23, 97.26, '../cv/Brennan_Newton.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 23);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-07-29', 'Fuller', 'Vaughan', 'master', '../photos/Fuller_Vaughan.jpg', 35700.35, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 24);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-06-23', 'Giacomo', 'Sims', 'dr', '../photos/Giacomo_Sims.jpg', 35600.16, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (25, 17.5, 27360.54);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 25);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-21', 'Kyra', 'Estes', 'mr', '../photos/Kyra_Estes.jpg', 47200.63, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (26, 129.32, '../cv/Kyra_Estes.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 26);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-07-13', 'Drake', 'Roberson', 'mrs', '../photos/Drake_Roberson.jpg', 68000.40, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 27);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-07-24', 'Janna', 'Barr', 'miss', '../photos/Janna_Barr.jpg', 30800.22, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (28, 19.5, 20640.05);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 28);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-14', 'Roanna', 'Russell', 'master', '../photos/Roanna_Russell.jpg', 28100.01, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (29, 76.99, '../cv/Roanna_Russell.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 29);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-04', 'Clio', 'Vincent', 'dr', '../photos/Clio_Vincent.jpg', 15800.55, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 30);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-03-26', 'Heidi', 'Gibbs', 'mr', '../photos/Heidi_Gibbs.jpg', 53300.90, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (31, 37.5, 25860.39);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 31);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-09-07', 'Noah', 'Duke', 'mrs', '../photos/Noah_Duke.jpg', 90600.08, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (32, 248.22, '../cv/Noah_Duke.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 32);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-06-07', 'Cole', 'Short', 'miss', '../photos/Cole_Short.jpg', 04300.69, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 33);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-03-03', 'Germane', 'Mcmillan', 'master', '../photos/Germane_Mcmillan.jpg', 18200.43, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (34, 43.5, 20740.74);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 34);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-12-17', 'Katell', 'Montgomery', 'dr', '../photos/Katell_Montgomery.jpg', 00800.03, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (35, 2.19, '../cv/Katell_Montgomery.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 35);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-05-28', 'Alexander', 'Nichols', 'mr', '../photos/Alexander_Nichols.jpg', 24700.85, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 36);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-10', 'Upton', 'Stafford', 'mrs', '../photos/Upton_Stafford.jpg', 92300.94, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (37, 88.5, 28890.15);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 37);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-02-15', 'Mohammad', 'Weaver', 'miss', '../photos/Mohammad_Weaver.jpg', 72800.19, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (38, 199.45, '../cv/Mohammad_Weaver.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 38);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-07', 'Sigourney', 'Witt', 'master', '../photos/Sigourney_Witt.jpg', 48000.50, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 39);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-13', 'Acton', 'Cantrell', 'dr', '../photos/Acton_Cantrell.jpg', 56600.49, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (40, 52.5, 24580.46);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 40);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-07-18', 'Allistair', 'Jacobson', 'mr', '../photos/Allistair_Jacobson.jpg', 07100.32, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (41, 19.45, '../cv/Allistair_Jacobson.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 41);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1964-11-16', 'Byron', 'Wilder', 'mrs', '../photos/Byron_Wilder.jpg', 94900.04, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 42);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-03-14', 'Michael', 'Howell', 'miss', '../photos/Michael_Howell.jpg', 55800.33, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (43, 69.5, 23100.09);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 43);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-03-24', 'Yael', 'Warren', 'master', '../photos/Yael_Warren.jpg', 37700.69, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (44, 103.29, '../cv/Yael_Warren.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 44);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-09-07', 'Ulysses', 'Beck', 'dr', '../photos/Ulysses_Beck.jpg', 16700.72, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 45);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-08-12', 'Jacqueline', 'Spencer', 'mr', '../photos/Jacqueline_Spencer.jpg', 75600.58, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (46, 45.5, 22860.08);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 46);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1942-03-26', 'Sara', 'Velasquez', 'mrs', '../photos/Sara_Velasquez.jpg', 51200.82, 'employee_billable');
INSERT INTO BillableEmployee (emp_id, day_rate, cv) VALUES (47, 140.28, '../cv/Sara_Velasquez.pdf');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 47);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1964-10-11', 'Rhea', 'Humphrey', 'miss', '../photos/Rhea_Humphrey.jpg', 01100.56, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (3, 48);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1964-11-22', 'Igor', 'Manning', 'master', '../photos/Igor_Manning.jpg', 31200.71, 'employee_sales');
INSERT INTO SalesEmployee (emp_id, commission, revenue) VALUES (49, 50.5, 28010.85);
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (1, 49);

INSERT INTO Employee (dob, f_name, l_name, title, picture, salary, emp_type) VALUES ('1975-09-15', 'Shad', 'Stanley', 'dr', '../photos/Shad_Stanley.jpg', 67400.47, 'employee');
INSERT INTO ProjectEmployee (p_id, emp_id) VALUES (2, 50);

