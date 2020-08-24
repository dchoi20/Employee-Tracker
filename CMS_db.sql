drop database if exists CMS_db;

create database CMS_db;

use CMS_db;

create table department (
    id INT AUTO_INCREMENT,
    name VARCHAR(30),
    primary key (id)
);

CREATE TABLE role (
    id INT AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    primary key (id),
    FOREIGN KEY(department_id) REFERENCES department(id)
);

CREATE TABLE employee (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT,
    primary key (id),
    FOREIGN KEY (role_id) REFERENCES role(id)
); 


-- 
INSERT INTO employee (first_name, last_name, role_id, )
VALUES ("John", "Harbaugh", 1);

INSERT INTO employee  (first_name, last_name, role_id, manager_id)
VALUES("Greg", "Roman", 2, 1);

INSERT INTO employee  (first_name, last_name, role_id, manager_id)
VALUES("Wink", "Martindale", 3, 1);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Lamar", "Jackson", 4, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Robert", "Griffin", 4, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("JK", "Dobbins". 5, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Mark", "Ingram", 5, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Justice", "Hill", 5, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Hollywood", "Brown", 6, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Mark", "Andrews", 6, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Willie", "Snead", 6, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Patrick", "Queen", 7, 3);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Matt", "Judon", 7, 3);


-- 

-- 
INSERT INTO department (name)
VALUES ("Coaching Staff");

INSERT INTO department (name)
VALUES ("Player");

-- 

INSERT INTO role (title, salary, department_id)
VALUES ("Head Coach", "10000", 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Offensive Coordinator", "2000", 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Defensive Coordinator", "200", 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Quarterback", "50000", 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Running Back", "10000", 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Wide Receiver", "10000", 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Linebacker", "5000", 2);



