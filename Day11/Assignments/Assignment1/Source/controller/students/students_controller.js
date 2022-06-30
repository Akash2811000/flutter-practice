var express = require('express');
var router = express.Router();
var StudentDomain = require("../../domain/controller_domain/students_domain");
var fees = require("./child/fees_controller");
var result = require("./child/result_controller");

class StudentController {
    static async get(req,res) {
        const studentDomain = new StudentDomain();
        studentDomain.getAllStudent(req,res);
    }

    static async getStudentRecord(req,res) {
        const studentDomain = new StudentDomain();
        studentDomain.getStudentReacord(req,res);
    }

    static async createStudent(req,res){
        const studentDomain = new StudentDomain();
        studentDomain.createStudent(req,res);
    }

    static async deleteStudent(req,res){
        const studentDomain = new StudentDomain();
        studentDomain.deleteStudent(req,res)
    }

    static async updareStudent(req,res){
        const studentDomain = new StudentDomain();
        studentDomain.updateStudent(req,res);
    }

    

}


router.use("/:studentId/fees",fees)
router.use("/:studentId/result",result)
router.get("/", StudentController.get);
router.get("/:studentId", StudentController.getStudentRecord);
router.post("/",StudentController.createStudent);
router.delete('/:studentId',StudentController.deleteStudent);
router.put("/:studentId",StudentController.updareStudent);
module.exports = router;