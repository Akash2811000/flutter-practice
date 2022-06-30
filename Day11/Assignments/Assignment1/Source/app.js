const express = require('express')
const app = express();
const logger = require("./middleware/logger");
const login = require("./controller/login/login_controller");
const employees = require("./controller/employees/employee_controller");
const students = require("./controller/students/students_controller");
const veryfytoken = require("./authentication/verifytoken")
const createError = require('http-errors');

const port = 3000

app.use(express.json());
app.use(logger);


  

app.get('/', (req, res) => res.send('Hello World!'))
app.listen(port, () => console.log(`Example app listening on port ${port}!`));


app.use("/login",login);
//app.use(veryfytoken);
app.use("/emps", employees);
app.use("/students",students);

app.use(function (req,res,next){
    next(createError(404));
});


