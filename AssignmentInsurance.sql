create database pramati;

use pramati;


create table companies(
	comp_id int not null primary key,
	company varchar(30)
	
);

insert into companies(comp_id, company)
	values(1, "HDFC"),
		  (2, "SBI"),
		  (3, "ICIC"),
		  (4, "LIC"),
		  (5, "KODAK"),
		  (6, "MUTHUT");
		 
create table department(
	dept_id int primary key,
	department varchar(30)
);


insert into department(dept_id, department)
		values(1, "SDE"),
			  (2, "HR"),
			  (3, "Accounts"),
			  (4, "PR"),
			  (5, "SUPPORT");

create table gender(
	gender_id int primary key, 
	gender varchar(30)
);


insert into gender(gender_id, gender)
values(1, "Male"),
	  (2, "Female");

create table relation(
	relation_id int primary key,
	relation varchar(30)
);

insert into relation(relation_id, relation)
	values(1, "Father"),
		  (2, "Mother"),
		  (3, "Sister"),
		  (4, "Brother"),
		  (5, "Wife"),
		  (6, "Husband"),
		  (7, "Son"),
		  (8, "Daughter"),
		  (9, "Father in law"),
		  (10, "Mother in law");
		 
-- to store all the data of term insurance
create table gpap(
	gpap_id int not null auto_increment, 
	amount int,
	primary key(gpap_id)
);

insert into gpap(gpap_id, amount) 
	values(1, 20000000),
		  (2, 40000000);
		 

-- make cycle for the years
create  table cycleyear(
	cycle_id int not null primary key,
	startyear int unique not null,
	endyear int not null,
	company_id int,
	aboutcycle varchar(30),
	foreign key(company_id) references companies(comp_id)
);


insert into cycleyear(cycle_id, startyear, endyear, aboutcycle, company_id)
values(1, 2016, 2017, "first", 1),
	  (2, 2017, 2018, "second", 2),
	  (3, 2018, 2019, "third", 3),
	  (4, 2019, 2020, "fourth", 4),
	  (5, 2020, 2021, "fifth", 5),
	  (6, 2021, 2022, "fifth", 6),
	  (7, 2022, 2023, "fifth", 4),
	  (8, 2023, 2024, "fifth", 5);



-- to store all the data of health insurance
create table ghi(
	ghi_id int not null auto_increment, 
	amount int,
	cycle_id int, 
	primary key(ghi_id),
	foreign key(cycle_id) references cycleyear(cycle_id)
);


insert into ghi(ghi_id, amount, cycle_id) 
	values(1, 500000, 8),
		  (2, 250000, 8);	
		 
		 
-- to store all the topups in Health insurance
create table topup(
	topup_id int not null auto_increment,
	amount int not null, 
	installment int not null,
	primary key(topup_id)
);


insert into topup(topup_id, amount, installment)
values(1, 150000, 2500),
	  (2, 100000, 2200),
	  (3, 75000, 2000),
	  (4, 50000, 1500),
	  (5, 25000, 1200),
	  (6, 20000, 1000),
	  (7, 10000, 750);
	 
	 
-- to store all insurances 
create table insurance(
	insurance_id int,
	ghi_id int, 
	gpap_id int,
	topup_id int,
	cycle_id int,
	primary key(insurance_id),
	foreign key(cycle_id) references cycleyear(cycle_id),
	foreign key(ghi_id) references ghi(ghi_id),
	foreign key(gpap_id) references gpap(gpap_id),
	foreign key(topup_id) references topup(topup_id)
);

insert into insurance(insurance_id, ghi_id, gpap_id, topup_id, cycle_id)
values(1, 1, 2, 3, 1),
	  (2, 1, 2, 1, 1),
	  (3, 1, 2, 4, 1),
	  (4, 1, 2, 6, 1),
	  (5, 1, 2, 3, 1),
	  (6, 1, 2, 7, 1),
	  (7, 1, 2, 5, 1);
	 
	 
-- to store data of employees
create table employee(
	emp_id int not null auto_increment, 
	name varchar(30) not null, 
	email varchar(30) not null,
	phone_no int not null,
	bloodgrp char(4) null,
	insurance_id int unique,
	department_id int ,
	gender_id int,
	primary key (emp_id),
	foreign key(gender_id) references gender(gender_id),
	foreign key(department_id) references department(dept_id),
	foreign key(insurance_id) references insurance(insurance_id)
);

insert into employee(emp_id, name, email, phone_no, bloodgrp, insurance_id, gender_id, department_id)
values(1, "shivam", "s@gmail.com", 123467, 'O+', 1, 1, 1),
	  (2, "Raman", "r@gmail.com", 2343467, 'A+', 2, 1, 2),
	  (3, "Praveen", "p@gmail.com", 82739, 'B+', 3, 1, 2),
	  (4, "Preeti", "k@gmail.com", 1981349, 'AB+', 4, 2, 3),
	  (5, "Akash", "a@gmail.com", 582181, 'O-', 5, 2, 2),
	  (6, "Sweta", "d@gmail.com", 12351, 'B-', 6, 1, 4),
	  (7, "Bhaskar", "b@gmail.com", 1098731, 'AB-', 7, 1, 5);
	
	 
create table nominee(
	emp_id int not null,
	name varchar(30) not null,
	dob date,
	gender_id int, 
	relation_id int,
	primary key(emp_id),
	foreign key (emp_id) references employee(emp_id),
	foreign key(gender_id) references gender(gender_id),
	foreign key(relation_id) references relation(relation_id)
);


insert into nominee(emp_id, name, dob, gender_id, relation_id)
	values(1, "Sweta", "1999-7-23", 2, 5),
		  (2, "Aparna", "1999-7-23", 2, 5),
		  (3, "Puja", "1999-7-23", 2, 5),
		  (4, "Rishab", "1999-7-23", 2, 5),
		  (5, "Mona", "1999-7-23", 2, 5),
		  (6, "Sawan", "1999-7-23", 2, 5),
		  (7, "Meenu", "1999-7-23", 2, 5);
	 
create table dependents(
	dep_id int primary key auto_increment,
	emp_id int not null,
	name varchar(30) not null,
	dob date, 
	gender_id int, 
	relation_id int,
	foreign key(gender_id) references gender(gender_id),
	foreign key(emp_id) references employee(emp_id),
	foreign key(relation_id) references relation(relation_id)
);
drop table dependents ;
insert into dependents(dep_id, emp_id, name, dob, gender_id, relation_id)
	values(1, 1, "Manoj Singh", "1973-8-23", 2, 1),
		  (2, 1, "Priyank Singh", "1980-5-23", 2, 2),
		  (3, 2, "Pratik Singh", "1999-7-23", 2, 1),
		  (4, 2, "Sevati Devi", "1999-7-23", 2, 2),
		  (5, 3, "Sahayak singh", "1999-7-23", 2, 1),
		  (6, 3, "Karun Daya", "1999-7-23", 2, 2),
		  (7, 7, "Rajesh Ram", "1999-7-23", 2, 1);
		 

create table cycle_enrolment(
	enroll_id int primary key,
	emp_id int not null,
	cycle_id int not null,
	foreign key(cycle_id) references cycleyear(cycle_id),
	foreign key(emp_id) references employee(emp_id)	
);


insert into cycle_enrolment(enroll_id, emp_id, cycle_id)
	values(1, 1, 8),
		  (2, 2, 8),
		  (3, 3, 8),
		  (4, 4, 8),
		  (5, 5, 8),
		  (6, 6, 8),
		  (7, 7, 8);
		  
		 
create table adding_topup(
	id int primary key,
	cycle_id int, 
	topup_id int,
	foreign key(cycle_id) references cycleyear(cycle_id),
	foreign key(topup_id) references topup(topup_id)
	
);

insert into adding_topup (id, cycle_id, topup_id)
values(1, 8, 3),
	  (2, 8, 4),
	  (3, 8, 2),
	  (4, 8, 1),
	  (5, 7, 5),
	  (6, 5, 4),
	  (7, 3, 1);

