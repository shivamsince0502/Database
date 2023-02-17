create database lms;
use lms;



create table departments(
	dept_id bigint primary key,
    dept_name varchar(30),
    dept_desc varchar(30)
);

insert into departments(dept_id, dept_name, dept_desc)
	value(1, "Software Development", "SDLC, FE, BE"),
		  (2, "Support", "Test and support"),
          (3, "Accounts", "Acounts management"),
          (4, "Finance", "delaing with finances"),
          (5, "Security", "global security and management");

create table designation(
	designation_id bigint primary key,
    designation_name varchar(30),
    designation_desc varchar(50)
);

insert into designation(designation_id, designation_name, designation_desc)
	value(1, "Software Developer", "SDLC, FE, BE"),
		  (2, "Support Engineer", "Test and support"),
          (3, "Accountant", "Acounts management"),
          (4, "Finance specialist", "delaing with finances"),
          (5, "Security Associate", "global security and management");

create table employee(
	emp_id bigint primary key,
    first_name varchar(30), 
    last_name varchar(30),
    age int,
    gender boolean,
    email varchar(30),
    mob_no bigint,
    dept_id bigint,
    designation_id bigint,
    isAdmin boolean,
    foreign key (dept_id)references departments(dept_id),
    foreign key (designation_id)references designation(designation_id)    
);

insert into employee(emp_id, first_name, last_name, age, gender, email, mob_no, dept_id, designation_id, isAdmin)
		value(1, "Shviam", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 1, 1, true),
			  (2, "Harshit", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 2, 3, true),
              (3, "Rahul", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 2, 4, true),
              (4, "Sharaan", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 3, 1, true),
              (5, "Shviam", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 3, 5, true),
              (6, "puneet", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 2, 3, true),
              (7, "Ritu", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 5, 4, true),
              (8, "rani", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 4, 4, true),
              (9, "shreya", "kumar", 21, true, "alskdfja)@gmail.com", 7682943594, 5, 3, true);

create table admin_users(
	user_id bigint primary key,
    username varchar(15),
    user_password char(60),
    employee_id bigint unique key,
    foreign key (employee_id) references employee(emp_id)
);



insert into admin_users(user_id, username, user_password, employee_id)
	value(1, "alpha", "aiufh9283", 1),
		  (2, "beta", "aweiuhw343", 3),
          (3, "gama", "kjh24393", 4),
          (4, "delta", "mvbnvm34523", 6),
          (5, "hiphen", "pmklnqdx234", 7);

create table leave_type(
	leave_id int primary key,
    leave_type varchar(30),
    leave_desc varchar(30),
    number_of_days_allowed int
);

insert into leave_type(leave_id, leave_type, leave_desc, number_of_days_allowed)
		  value(1, "Maternal ", "for pregnant womens", 30),
               (2, "Accidental ", "for Accidents ", 100),
               (3, "Family ", "for Family issues", 50),
               (4, "marriage ", "for marriage", 20),
               (5, "upskill ", "for upskilling", 40);

create table leave_application(
	application_ref_id bigint primary key,
    employee_id bigint,
    leave_type_id int,
    date_of_application datetime,
    attatchment blob,
    leave_status boolean,
    date_of_approval datetime,
    message_by_admin varchar(30),
	foreign key (employee_id)references employee(emp_id),
    foreign key (leave_type_id)references leave_type(leave_id) 
);

          
          
insert into leave_application(application_ref_id, employee_id, leave_type_id, date_of_application, attatchment, leave_status,
								date_of_approval, message_by_admin)
			value(1, 2, 2, "2023-03-02", "", 2, "2023-03-01", "report again shortly"),
				  (2, 3, 4, "2023-03-02", "", 2, "2023-03-01", "report again shortly"),
                  (3, 6, 3, "2023-03-02", "", 2, "2023-03-01", "report again shortly"),
                  (4, 5, 1, "2023-03-02", "", 2, "2023-03-01", "report again shortly"),
                  (5, 4, 3, "2023-03-02", "", 2, "2023-03-01", "report again shortly");
          
create table employee_application(
	id int primary key,
    empid bigint,
    application_ref_id bigint,
    foreign key (empid)references employee(emp_id),
    foreign key (application_ref_id)references designation(designation_id) 
);

insert into employee_application(id, empid, application_ref_id)
			value(1, 2, 1),
				  (2, 1, 3),
                  (3, 3, 4),
                  (4, 4, 2),
                  (5, 6, 2),
                  (6, 2, 5);
