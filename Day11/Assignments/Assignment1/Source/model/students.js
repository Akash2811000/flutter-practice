const mongoose = require('mongoose');   
mongoose.connect('mongodb://localhost:27017/mydata');

const studentSchema =  mongoose.Schema({
    
        "ID": Number,
        "Name": String,
        "Address": String,
        "Fees": {
            "Amount": Number,
            "PaymentDate": Date,
            "Status": String
        },
        "Result": {
            "Hindi": Number,
            "Eng": Number,
            "Math": Number,
            "Total": Number,
            "Grade": String
        }

});


const studentmodel = mongoose.model('students', studentSchema);
// var st = new studentSchema({Id: 1,Name: "xyz",Address:"kalol"});
// st.sava().then(() => console.log("data added"));

module.exports = studentmodel;

