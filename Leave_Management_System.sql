CREATE TABLE department
(department_id NUMBER(5),
department_name VARCHAR2(18),
CONSTRAINT department_department_id_pk PRIMARY KEY(department_id),
CONSTRAINT department_department_name_uk UNIQUE(department_name)
);


CREATE TABLE leave
(leave_id NUMBER(5),
leave_name VARCHAR2(30) CONSTRAINT leave_leave_name_nn NOT NULL,
leave_desc VARCHAR2(50),
leave_requirement VARCHAR2(50),
leave_duration NUMBER(2),
CONSTRAINT leave_leave_id_pk PRIMARY KEY(leave_id));


CREATE TABLE employee
(emp_id NUMBER(5),
last_name VARCHAR2(30) CONSTRAINT employee_lastname_nn NOT NULL,
first_name VARCHAR2(30) CONSTRAINT employee_firstname_nn NOT NULL,
emp_address VARCHAR2(255) CONSTRAINT employee_empaddress_nn NOT NULL,
employment_date DATE CONSTRAINT employee_employmentdate_nn NOT NULL,
emp_dob DATE CONSTRAINT employee_empdob_nn NOT NULL,
salary NUMBER(5),
emp_phoneno NUMBER(15),
emp_email VARCHAR2(255) CONSTRAINT employee_empemail_uk UNIQUE,
supervisor_id NUMBER(5),
department_id NUMBER(5),
CONSTRAINT employee_emp_id_pk PRIMARY KEY(emp_id),
CONSTRAINT employee_supervisor_id_fk FOREIGN KEY (supervisor_id) REFERENCES employee(emp_id) ON DELETE SET NULL,
CONSTRAINT employee_department_id_fk FOREIGN KEY (department_id) REFERENCES department(department_id));


CREATE TABLE application
(app_id NUMBER(5),
employee_id NUMBER(5) CONSTRAINT application_employee_id_nn NOT NULL,
leave_id NUMBER(5) CONSTRAINT application_leave_id_nn NOT NULL,
from_date DATE CONSTRAINT application_from_date_nn NOT NULL,
to_date DATE CONSTRAINT application_to_date_nn NOT NULL,
app_desc VARCHAR2(255),
app_status VARCHAR2(255) CONSTRAINT application_app_status_nn NOT NULL,
department_id NUMBER(5) CONSTRAINT application_department_id_nn NOT NULL,
CONSTRAINT application_app_id_pk PRIMARY KEY (app_id),
CONSTRAINT application_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
CONSTRAINT application_leave_id_fk FOREIGN KEY (leave_id) REFERENCES leave(leave_id),
CONSTRAINT application_department_id_fk FOREIGN KEY (department_id) REFERENCES department(department_id));


CREATE TABLE leavelog
(log_id number(5),
leave_quota number(10),
department_id number(5),
emp_id number(5),
primary key (log_id),
foreign key (department_id) references department(department_id),
foreign key (emp_id) references employee(emp_id) ON DELETE CASCADE);


---- inserting into deparment table
INSERT INTO department VALUES (58001, 'Marketing');

INSERT INTO department VALUES (58002, 'Accounting');

INSERT INTO department VALUES (58003, 'Production');

INSERT INTO department VALUES (58004, 'Financial');

INSERT INTO department VALUES (58005, 'Human Resource');


--- inserting records into LEAVE
INSERT INTO leave VALUES
(001, 'Unpaid Leave', '', '', '');

INSERT INTO leave VALUES
(002, 'Sick Leave', 'Paid leave for sick employee', 'Medical Certificate', '');

INSERT INTO leave VALUES
(003, 'Annual Leave', 'Annual paid leave for employee', '', '');

INSERT INTO leave VALUES
(004, 'Maternity Leave', 'Unpaid leave for pregnant employee', 'Gender', 90);

INSERT INTO leave VALUES
(005, 'Examination Leave', 'For employee who need to undergo exam', 'Examination Slip', 14);

INSERT INTO leave VALUES
(006, 'Marriage Leave', 'For single employee', 'Martial Status', 14);

INSERT INTO leave VALUES
(007, 'Paternity Leave', 'For married male employee', 'Gender', '');

INSERT INTO leave VALUES
(008, 'Prolong Illness Leave', 'For employee that have long term illness', 'Medical Report', 60);

INSERT INTO leave VALUES
(009, 'Hospitalization Leave', 'Hospitalized employee eligible to take this leave', 'Medical Report', 21);


--- insterting records into EMPLOYEE
INSERT INTO employee VALUES
(19001, 'McKenzie', 'Finley', '98 Buckingham Rd', TO_DATE('09/21/2019', 'MM/DD/YYYY'), TO_DATE('10/24/1994', 'MM/DD/YYYY'), 2000, 7769436144, 'finleymc@mail.com', '',58001);

INSERT INTO employee VALUES
(19002, 'Morley', 'Robert', '28 Stroude Road', TO_DATE('01/28/2015', 'MM/DD/YYYY'), TO_DATE('10/08/1992', 'MM/DD/YYYY'), 3500, 7746257082, 'robert01@mail.com', '', 58001);

INSERT INTO employee VALUES
(19003, 'Fowler', 'Summer', '87 St James Boulevard', TO_DATE('12/03/2011', 'MM/DD/YYYY'), TO_DATE('03/11/1971', 'MM/DD/YYYY'), 4500, 7772907065, 'sumfow22@mail.com', '', 58005);

INSERT INTO employee VALUES
(19004, 'Cooke', 'Harriet', '92 Wartnaby Road', TO_DATE('05/03/2017', 'MM/DD/YYYY'), TO_DATE('05/01/1972', 'MM/DD/YYYY'), 3000, 7885399316, 'harrietc@mail.com', 19003, 58003);

INSERT INTO employee VALUES
(19005, 'Ashton', 'Oscar', '47 Ramsgate Rd', TO_DATE('11/29/2016', 'MM/DD/YYYY'), TO_DATE('04/28/1977', 'MM/DD/YYYY'), 4200, 7005444183, 'oscarman@mail.com', 19003, 58004);

INSERT INTO employee VALUES
(19006, 'Coleman', 'Jordan', '28 Bootham Crescent', TO_DATE('01/23/2010', 'MM/DD/YYYY'), TO_DATE('01/23/1979', 'MM/DD/YYYY'), 6000, 7967887563, 'coleman97@mail.com', '', 58002);

INSERT INTO employee VALUES
(19007, 'Lamb', 'Rhys', '72 Quay Street', TO_DATE('02/25/2013', 'MM/DD/YYYY'), TO_DATE('04/16/1979', 'MM/DD/YYYY'), 5200, 7053432547, 'rhyslamb@mail.com', 19003, 58004);

INSERT INTO employee VALUES
(19008, 'Hicks', 'Isabelle', '27 Park Avenue', TO_DATE('03/22/2014', 'MM/DD/YYYY'), TO_DATE('03/09/1985', 'MM/DD/YYYY'), 4800, 7847313898, 'hicksbell@mail.com', '', 58002);

INSERT INTO employee VALUES
(19009, 'Dickerson', 'Percy', '3857 Hillside Drive', TO_DATE('04/02/2018', 'MM/DD/YYYY'), TO_DATE('10/04/1987', 'MM/DD/YYYY'), 3700, 3395329551, 'dickerson@mail.com', 19003, 58005);

INSERT INTO employee VALUES
(19010, 'Patterson', 'Joel', '20 Crescent Avenue', TO_DATE('04/12/2018', 'MM/DD/YYYY'), TO_DATE('03/18/1991', 'MM/DD/YYYY'), 3300, 7715263995, 'patjoel@mail.com', 19003, 58002);


--- insterting records into APPLICATION
INSERT INTO application VALUES 
(1, 19001, 001, TO_DATE('02/21/2020', 'MM/DD/YYYY'), TO_DATE('02/22/2020', 'MM/DD/YYYY'), 'Emergency matter', 'Approved', 58001);

INSERT INTO application VALUES 
(2, 19003, 007, TO_DATE('03/21/2019', 'MM/DD/YYYY'), TO_DATE('03/22/2019', 'MM/DD/YYYY'), 'Wife is delivering baby', 'Approved', 58005);

INSERT INTO application VALUES 
(3, 19004, 005, TO_DATE('05/02/2018', 'MM/DD/YYYY'), TO_DATE('05/16/2018', 'MM/DD/YYYY'), 'Oracle Expert Test', 'Pending', 58003);

INSERT INTO application VALUES 
(4, 19007, 002, TO_DATE('04/26/2014', 'MM/DD/YYYY'), TO_DATE('04/28/2014', 'MM/DD/YYYY'), 'Not feeling well', 'Rejected', 58004);

INSERT INTO application VALUES 
(5, 19002, 009, TO_DATE('11/13/2015', 'MM/DD/YYYY'), TO_DATE('12/3/2015', 'MM/DD/YYYY'), 'Suspected infection', 'Pending', 58001);

INSERT INTO application VALUES 
(6, 19005, 003, TO_DATE('05/28/2010', 'MM/DD/YYYY') , TO_DATE('06/3/2010', 'MM/DD/YYYY'), '', 'Pending', 58004);


--- insterting records into LEAVELOG
INSERT INTO leavelog VALUES
(20001, 20, 58001,19001);

INSERT INTO leavelog VALUES
(20002, 12, 58002, 19006);

INSERT INTO leavelog VALUES
(20003, 21,58005, 19003);

INSERT INTO leavelog VALUES
(20004, 06, 58004, 19005);

INSERT INTO leavelog VALUES
(20005, 24,58005, 19009);


COMMIT;