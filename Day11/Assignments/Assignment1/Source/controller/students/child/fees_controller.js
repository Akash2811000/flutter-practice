var express = require("express");
var router = express.Router({mergeParams: true});
var StudentDomain = require("../../../domain/controller_domain/students_domain");

class FeeController {
    static async getFees(req,res){
        const studentDomain = new StudentDomain();
        studentDomain.getFees(req,res);
    }

    static async updateFees(req,res){
        const studentDomain = new StudentDomain();
        studentDomain.updateStudetFees(req,res);
    }
}

router.get("/",FeeController.getFees);
router.put("/",FeeController.updateFees);
module.exports = router;