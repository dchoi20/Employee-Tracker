const inquirer = require("inquirer");

function addEmployee() {
  inquirer
    .prompt([
      {
        type: "input",
        name: "firstName",
        message: "What is the first name of employee?",
      },
      {
        type: "input",
        name: "lastName",
        message: "What is the last name of employee?",
      },
    ])
    .then((res) => {
      connection.query(
        "INSERT INTO employee (first_name, last_name) VALUES (?, ?)",
        [res.firstName, res.lastName],
        (err, data) => {
          if (err) return err;
          employeeTracker();
        }
      );
    });
}

module.exports = addEmployee;
