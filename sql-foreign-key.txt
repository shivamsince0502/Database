-- create a database with dept , address, employees
create database company;
use company;
create table employee(id int, name varchar(30), email varchar(30), salary integer, primary key (id));
show tables;
insert into employee(id, name, email, salary) 
values(1, "shivam", "s@gmail.com", 10000)
	  ,(2, "Rakesh", "R@gamil.com", 50000),
      (3, "Praveen", "p@gmail.com", 70000),
      (4, "Praveen", "p@gmail.com", 90000),
      (5, "Praveen", "p@gmail.com", 110000),
      (6, "Praveen", "p@gmail.com", 120000);
select * from employee;
create table department(deptId int, empId int, deptName varchar(30), 
numberOfEmployees int,
 primary key(deptId), 
 foreign key(empId) references employee(id));
insert into department(deptId, empId, deptName, numberOfEmployees)
values(1, 6, "Accounts", 5),
	(2, 5,  "Human Resource", 50),
	(3, 5,  "IT", 15),
	(4,  3, "Software Dev", 20),
	(5,  1, "Support", 12),
    (6, 3, "Finances", 9);
insert into department(deptId, empId, deptName, numberOfEmployees)
values(7, 4, "Finances", 5),
	(8, 2, "Software", 9);
create table address(empId int, address varchar(50), addressId int, primary key (empId), foreign key(empid) references employee(id));
insert into address(empId, address, addressId)
values(1, "Jharkhand", 1),
	(2, "Hyderabad", 2),
    (3, "Bihar", 3),
    (4, "Katihar",5),
    (6, "Darbhanga", 6);
update department set deptName = "Staffs" where deptId = 7;
update employee set name = "Kailash" where id = 3;
update employee set name = "Pranay" where id = 4;
update employee set name = "Kamal" where id = 5;
update employee set name = "Raman" where id = 6;
-- inner join operations on the table employee and address for showing each employees addresss as stored in address table
select * from employee inner join address on employee.id = address.empId;

-- doing left join operations on employee table and department table will show all the departments to which employees are associated with
select * from employee left join department on employee.id = department.empId;

-- doing right join operations on employee table and department table will show all the departments having employees;
select * from department right join employee on employee.id = department.empId;
		

