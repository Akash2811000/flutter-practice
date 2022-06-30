-> mplement Folder structute for the Node Application. Main Module of the Application will be Authentication,Student,Employee Employee->Assignment Module Student->Fees Student->Result

- create some folder like authentication,controller,domain,model,middlewear one file app.js
- crete data base file in mongo db and upload json file for that data
- cretae middlewear of logger that print method , url , and time
- use this logger function to in app.js

- create config file that has secret key and algorithm 

- first create login controller
- inside login require express, router, and jwt
- require config file
- create router.post for login create user data object that hase username , password from req.body
- create token var that has jwt.sign method that method require userdata, secret key , algorithm , and expiresIn;
- if( user data is related to admin) than return res, message and token
- else res print error message
- export that router

- create verifytoken file 
- that file require jwt , and config file
- definf function for verifytoken that has req,res,next
- that contan one variable token that has req.headers
- jwt.verify mehthod that require token , secret key, and algorithm
- create callback function that print err message
- require that verify in app.js and use app.use

- crete one model folder that model folder consiste all scema about employee and student
- first npm install mongoose
- inside employye.js require mongoose
- that conncet using mongoose.connect command
- crete employeeSchema that has some filed and some validation 
- crete one model variable and insert that scehma to model
- export that model
- follow same process for student 

- create employeedomain file in domain
- that dile require express , employee model
- cretae class EmployeeDomain that has some method
- getallemployee that find using model.find method send result
- getanemployee that get id from params using model.find method this method find pass as query id find the particular employee
- getAllassignment take id from params  and define one query {EmpId : id} then model.find(query , {Assignments: 1}) then return result that get an assignment
- getAnAssignment that take assignmentid and id from params define query that take EmpId: id then model.find(query,usi eleMatch ) eleMatch get particular assignment
- cretaeEmployee method that crete new employee using validation using save method save the data
- export Employeedomain



- create employeecontroller.js inside controller
- that require employee domain and router
- create class EmployeeController 
- that has method get that call employeedomain.getAllEmployee
- method getAnEmployee that return employeedomain.getAnEmployee
- method createAnEmployee that return employeeDomain.createAnEmployee
- then router.get('/', EmployeeController.get);
- router.get("/:EmpId", EmployeeController.getAnEmployee);
- router.post("/", EmployeeController.createAnEmployee);
- router.put("/", EmployeeController.updateAnEmployee);
- module.exports = router;
- require employees in app.js
- app.use("/emps", employees)


- follow same as above for student





