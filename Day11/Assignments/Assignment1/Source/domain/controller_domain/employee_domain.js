var express = require("express");
var employeemodel = require("../../model/employee")

var fs = require("fs");

class EmployeeDomain {
    getAllEmployee(req, res) {
        employeemodel.find({}, function (err, result) {
            res.send(result);
            res.end();
        })
    }

    getAnEmployee(req, res) {
        let id = req.params.EmpId;
        var query = { EmpId: id };
        employeemodel.find(query, function (err, result) {
            if (result.length == 0) {
                res.send("Data not found");
            } else {
                res.send(result);
                console.log(result)
                res.end();
            }
        })
    }



    getAllAssignment(req, res) {
        let id = req.params.EmpId;
        var query = { EmpId: id };
        employeemodel.find(query, {Assignments:1 ,_id :0},function (err, result) {
          if (result.length == 0) {
            res.send("Data not found");
          } else {
            res.send(result);
            console.log(result)
            res.end();
          }
        })
    }


    getAnAssignment(req, res) {
        let id = req.params.EmpId;
        let assignmetid = req.params.AssignmentId;
        var query = { EmpId: id };
        employeemodel.find(query, {Assignments: {$elemMatch: {AssignmentId: assignmetid}}, _id:0},function (err, result) {
          if (result.length == 0) {
            res.send("Data not found");
          } else {
            res.send(result);
            res.end();
          }
        })
        
    }

}

module.exports = EmployeeDomain;    