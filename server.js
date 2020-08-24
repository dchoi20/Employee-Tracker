const mysql = require("mysql");
const inquirer = require("inquirer");
const addEmployee = require("./functions/addEmployees");

const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "CMS_db",
});

function queryAsync(string) {
  return new Promise((resolve, reject) => {
    connection.query(string, (err, data) => {
      if (err) {
        return reject(err);
      }
      resolve(data);
    });
  });
}

connection.connect(function (err) {
  if (err) throw err;
  employeeTracker();
});

async function employeeTracker() {
  try {
    let { choice } = await inquirer.prompt({
      name: "choice",
      message: "What would you like to do?",
      choices: [
        "View All Employees",
        "View All Employees by Department",
        "Add Department",
        "Add Role",
        "Add Employee",
        "Update Employee Role",
        "Exit",
      ],
      type: "list",
    });
    switch (choice) {
      case "View All Employees":
        let employees = await queryAsync(`select  title, department.name, first_name, last_name from cms_db.department
        inner join role on department.id = role.department_id
        inner join employee on employee.role_id = role.id`);
        console.table(employees);
        employeeTracker();
        break;
      case "Add Employee":
        addEmployee();
        break;
      case "View All Employees by Department":
        // async function viewByDepartment() {
        try {
          let { choice } = await inquirer.prompt({
            name: "choice",
            message: "What would you like to do?",
            choices: ["Coaching Staff", "Player"],
            type: "list",
          });
          switch (choice) {
            case "Coaching Staff":
              let coachingstaff = await queryAsync(
                `select  department.name, first_name, last_name, title from cms_db.department
                          inner join role on department.id = role.department_id
                          inner join employee on employee.role_id = role.id
                          WHERE department.name = "Coaching Staff"`
              );
              console.table(coachingstaff);
              employeeTracker();
              break;
            case "Player":
              let players = await queryAsync(
                `select  department.name, first_name, last_name, title from cms_db.department
                            inner join role on department.id = role.department_id
                            inner join employee on employee.role_id = role.id
                            WHERE department.name = "Player"`
              );
              console.table(players);
              employeeTracker();
              break;
            case "exit": {
              connection.end();
            }
            default:
              break;
          }
        } catch (err) {
          console.log(err);
          connection.end();
        }
        // }

        break;
      case "Add Role":
        employeeTracker();
        break;
      case "exit": {
        connection.end();
      }
      default:
        break;
    }
  } catch (err) {
    console.log(err);
    connection.end();
  }
}
