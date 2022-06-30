var express = require("express");
var router = express.Router({mergeParams: true});
var EmployeeDomain = require("../../../domain/controller_domain/employee_domain");

class AssignmentCOntroller {
    static async getAllAssignment (req,res){
        const emplyeeDomain = new EmployeeDomain();
        emplyeeDomain.getAllAssignment(req,res);
    }

    static async getAnAssignment (req,res){
        const emplyeeDomain = new EmployeeDomain();
        emplyeeDomain.getAnAssignment(req,res);
    }
}


router.get("/",AssignmentCOntroller.getAllAssignment);
router.get("/:AssignmentId",AssignmentCOntroller.getAnAssignment);

module.exports = router;