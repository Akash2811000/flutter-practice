const mongoose = require("mongoose");
mongoose.connect("mongodb://localhost:27017/mydata", () => { console.log("db") })
const employeesSchema = mongoose.Schema(
    {
        "EmpId": Number,
        "FirstName": String,
        "LastName": String,
        "Assignments": [
            {
                "AssignmentId": Number,
                "AssignmentCategory": String,
                "AssignmentName": String,
                "AssignmentStatus": String,

            }

        ]

    })
const employeesModel = mongoose.model("employees", employeesSchema);

module.exports = employeesModel;