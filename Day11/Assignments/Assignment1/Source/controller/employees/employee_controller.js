var express = require('express');
var EmployeeDomain = require("../../domain/controller_domain/employee_domain");
var assignment = require("../employees/child/assignment_controller");
var router = express.Router();

class EmployeeController {

    static async get(req, res) {
        const employeedomain = new EmployeeDomain();
        employeedomain.getAllEmployee(req, res);
    }

    static async getAnEmployee(req, res) {
        const employeedomain = new EmployeeDomain();
        employeedomain.getAnEmployee(req, res);
    }

    static async createAnEmployee(req, res) {
        const employeeDomain = new EmployeeDomain();
        employeeDomain.createAnEmployee(req, res);
    }

    static async updateAnEmployee(req, res) {
        const employeeDomain = new EmployeeDomain();
        employeeDomain.updateAnEmployee(req, res);
    }

    
}

router.get('/', EmployeeController.get);
router.get("/:EmpId", EmployeeController.getAnEmployee);
router.post("/", EmployeeController.createAnEmployee);
router.put("/", EmployeeController.updateAnEmployee);


router.use("/:EmpId/assignment",assignment);
//router.use("/:EmpId/assignment/:AssignmentId",assignment);

module.exports = router;